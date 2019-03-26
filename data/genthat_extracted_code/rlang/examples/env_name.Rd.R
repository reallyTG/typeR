library(rlang)


### Name: env_name
### Title: Label of an environment
### Aliases: env_name env_label

### ** Examples

# Some environments have specific names:
env_name(global_env())
env_name(ns_env("rlang"))

# Anonymous environments don't have names but are labelled by their
# address in memory:
env_name(env())
env_label(env())



