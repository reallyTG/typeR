library(RSuite)


### Name: prj_clean_deps
### Title: Uninstalls unused packages from the local project environment.
### Aliases: prj_clean_deps

### ** Examples

## No test: 
  # create exemplary project base folder
  prj_base <- tempfile("example_")
  dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

  # start project
  prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)

  # add colorspace to master script
  master_script_fpath <- file.path(prj$path, "R", "master.R")
  write("library(colorspace)", file = master_script_fpath, append = TRUE)

  # install colorspace into project local environment
  prj_install_deps(prj = prj)

  # remove dependency to colorspace
  writeLines(head(readLines(master_script_fpath), n = -1),
             con = master_script_fpath)

  # uninstall colorspace from project local environment
  prj_clean_deps(prj = prj)
## End(No test)




