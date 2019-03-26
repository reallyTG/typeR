library(RSuite)


### Name: sysreqs_install
### Title: Updates system to satisfy detected requirements.
### Aliases: sysreqs_install

### ** Examples

# create exemplary project base folder
prj_base <- tempfile("example_")
dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

# start project
prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)

# add dependency to XML
write("library(XML)",
      file = file.path(prj$path, "R", "master.R"),
      append = TRUE)

## No test: 
  # check if requirements of XML are satisfied
  sysreqs_install(prj)
## End(No test)




