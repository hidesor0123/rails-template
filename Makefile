# If the first argument is "copy"...
ifeq (copy,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

copy:
	@cp -rvi config ${RUN_ARGS}
	@cp -rvi Capfile ${RUN_ARGS}
	@cp -rvi .dockerignore ${RUN_ARGS}
	@cp -rvi docker.env ${RUN_ARGS}
	@cp -rvi Dockerfile ${RUN_ARGS}
	@cp -rvi docker-compose.yml ${RUN_ARGS}
