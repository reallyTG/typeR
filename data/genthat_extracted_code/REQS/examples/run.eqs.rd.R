library(REQS)


### Name: run.eqs
### Title: Run EQS from R
### Aliases: run.eqs
### Keywords: utilities

### ** Examples


##not executable, valid serial number has to be provided
##res <- run.eqs(EQSpgm = "C:/Program Files/EQS61/WINEQS.EXE", EQSmodel = "c:/eqs61/examples/manul7.eqs", serial = "1234")

##For instance, to extract the parameter table you can do
##res$par.table

##simulation example: not executable, provide serial number and proper eqs script file
##simulated 100 replications, extract CFI
##cfivec <- NULL
##for (i in 1:100) {
##  X <- matrix(rnorm(1000), ncol = 10, nrow = 100)
##  res <- run.eqs(EQSpgm = "C:/Program Files/EQS61/WINEQS.EXE", EQSmodel = "c:/eqs61/examples/manul7.eqs", data = X, datname = "manul7.dat", serial = "1234")
##  cfivec <- c(cfivec, res.run$fit.indices[9,])
##}




