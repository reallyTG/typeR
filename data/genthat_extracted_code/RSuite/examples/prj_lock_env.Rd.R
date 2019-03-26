library(RSuite)


### Name: prj_lock_env
### Title: Locks the project environment.
### Aliases: prj_lock_env

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

  # present contents of lock file created
  cat(readLines(file.path(prj$path, "deployment", "env.lock")), sep = "\n")
## End(No test)



