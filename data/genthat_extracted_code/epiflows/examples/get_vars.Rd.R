library(epiflows)


### Name: get_vars
### Title: Access location metadata
### Aliases: get_vars get_vars.epiflows set_vars set_vars<-
###   set_vars.epiflows set_vars<-.epiflows

### ** Examples

data("Brazil_epiflows")
get_vars(Brazil_epiflows) # defined global variables pointint to column names
get_vars(Brazil_epiflows, "duration_stay")
get_vars(Brazil_epiflows, "duration_stay", vector = TRUE)



