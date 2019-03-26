library(pmpp)


### Name: create_fframe
### Title: Add empty rows with time stamps to each cress-sectional unit in
###   the panel
### Aliases: create_fframe

### ** Examples

data(EmplUK, package = "plm")
EmplUK <- dplyr::filter(EmplUK, year %in% c(1978, 1979, 1980, 1981, 1982))
my_fframe <- create_fframe(EmplUK, 1983)



