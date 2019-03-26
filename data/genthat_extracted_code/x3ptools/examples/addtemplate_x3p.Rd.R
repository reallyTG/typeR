library(x3ptools)


### Name: addtemplate_x3p
### Title: Add/change xml meta information in x3p object
### Aliases: addtemplate_x3p

### ** Examples

logo <- read_x3p(system.file("csafe-logo.x3p", package="x3ptools"))
# exchange meta information for general x3p information:
logo <- addtemplate_x3p(logo, template = system.file("templateXML.xml", package="x3ptools"))
logo$general.info



