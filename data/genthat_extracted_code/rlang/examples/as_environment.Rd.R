library(rlang)


### Name: as_environment
### Title: Coerce to an environment
### Aliases: as_environment

### ** Examples

# Coerce a named vector to an environment:
env <- as_environment(mtcars)

# By default it gets the empty environment as parent:
identical(env_parent(env), empty_env())


# With strings it is a handy shortcut for pkg_env():
as_environment("base")
as_environment("rlang")

# With NULL it returns the empty environment:
as_environment(NULL)



