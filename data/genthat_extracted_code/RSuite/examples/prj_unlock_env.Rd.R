library(RSuite)


### Name: prj_unlock_env
### Title: Unlocks the project environment.
### Aliases: prj_unlock_env

### ** Examples

## No test: 
  # create exemplary project base folder
  prj_base <- tempfile("example_")
  dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

  # start project
  prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)

  # build project local environment
  prj_install_deps(prj = prj)

  # lock project environment
  prj_lock_env(prj = prj)

  # unlock project environment
  prj_unlock_env(prj = prj)
## End(No test)



