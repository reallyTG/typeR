library(RSuite)


### Name: sysreqs_script
### Title: Creates a script to update the system to satisfy project
###   requirements.
### Aliases: sysreqs_script

### ** Examples

## No test: 
  # create exemplary project base folder
  prj_base <- tempfile("example_")
  dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

  # start project
  prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)

  # add dependency to XML
  write("library(XML)",
        file = file.path(prj$path, "R", "master.R"),
        append = TRUE)

  # generate script
  sysreqs_fpath <- sysreqs_script(prj)

  # present script contents
  cat(readLines(sysreqs_fpath), sep = "\n")
## End(No test)




