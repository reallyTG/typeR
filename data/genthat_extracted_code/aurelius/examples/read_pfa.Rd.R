library(aurelius)


### Name: read_pfa
### Title: read_pfa
### Aliases: read_pfa

### ** Examples

# literal JSON string  (useful for small examples)
toy_model <- read_pfa('{"input":"double","output":"double","action":[{"+":["input",10]}]}')

# from a local path, must be wrapped in "file" command to create a connection
local_model <- read_pfa(file(system.file("extdata", "my-model.pfa", package = "aurelius")))

# from a url (split on two lines so not to exceed 100 char wide during install)
url_model <- read_pfa(url(paste0('https://raw.githubusercontent.com/ReportMort/hadrian', 
                     '/feature/add-r-package-structure/aurelius/inst/extdata/my-model.pfa')))



