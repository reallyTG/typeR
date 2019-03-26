library(rlang)


### Name: search_envs
### Title: Search path environments
### Aliases: search_envs search_env pkg_env pkg_env_name is_attached
###   base_env global_env
### Keywords: internal

### ** Examples

# List the search names of environments attached to the search path:
search()

# Get the corresponding environments:
search_envs()

# The global environment and the base package are always first and
# last in the chain, respectively:
envs <- search_envs()
envs[[1]]
envs[[length(envs)]]

# These two environments have their own shortcuts:
global_env()
base_env()

# Packages appear in the search path with a special name. Use
# pkg_env_name() to create that name:
pkg_env_name("rlang")
search_env(pkg_env_name("rlang"))

# Alternatively, get the scoped environment of a package with
# pkg_env():
pkg_env("utils")



