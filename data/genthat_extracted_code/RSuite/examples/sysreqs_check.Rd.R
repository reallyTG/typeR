library(RSuite)


### Name: sysreqs_check
### Title: Checks for system requirements availability.
### Aliases: sysreqs_check

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
  # check if requirements or XML are satisfied
  sysreqs_check(prj)
## End(No test)




