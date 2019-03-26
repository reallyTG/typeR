library(phenofit)


### Name: init_lambda
### Title: Initial lambda value of Whittaker smoother
### Aliases: init_lambda

### ** Examples

library(phenofit)
data("MOD13A1")

dt <- tidy_MOD13.gee(MOD13A1$dt)
st <- MOD13A1$st

sitename <- dt$site[1]
d      <- dt[site == sitename, ] # get the first site data
lambda <- init_lambda(d$y)



