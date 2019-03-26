library(RJDemetra)


### Name: save_spec
### Title: Saving and loading a model specification, SA and pre-adjustment
###   in X13 and TRAMO-SEATS
### Aliases: save_spec load_spec

### ** Examples

## No test: 
myseries <- ipi_c_eu[, "FR"]
myreg1 <- regarima_def_x13(myseries, spec = "RG5c")
myspec2 <- regarima_spec_x13(myreg1, estimate.from = "2005-10-01", outlier.from = "2010-03-01")
myreg2 <- regarima(myseries, myspec2)

myreg3 <-regarima_def_tramoseats(myseries, spec = "TRfull")
myspec4 <-regarima_spec_tramoseats(myreg3, tradingdays.mauto = "Unused",
                                  tradingdays.option ="WorkingDays",
                                  easter.type = "Standard",
                                  automdl.enabled = FALSE, arima.mu = TRUE)
myreg4 <-regarima(myseries, myspec4)

myspec6 <- x13_spec_def("RSA5c")
mysa6 <- x13(myseries, myspec6)

myspec7 <- tramoseats_spec_def("RSAfull")
mysa7 <- tramoseats(myseries, myspec7)

dir <- tempdir()

 # Save the model specification from a c("regarima_spec","X13") class object
save_spec(myspec2, file.path(dir, "specx13.RData"))
 # Save the model specification from a c("regarima","X13") class object
save_spec(myreg2, file.path(dir,"regx13.RData"))
 # Save the model specification from a c("regarima_spec","TRAMO_SEATS") class object
save_spec(myspec4, file.path(dir,"specTS.RData"))
 # Save the model specification from a c("regarima","TRAMO_SEATS") class object
save_spec(myreg4, file.path(dir,"regTS.RData"))
 # Save model from a c("SA_spec","X13") class object
save_spec(myspec6, file.path(dir,"specFullx13.RData"))
 # Save model from a c("SA","X13") class object
save_spec(mysa6, file.path(dir,"sax13.RData"))
 # Save model from a c("SA_spec","TRAMO_SEATS") class object
save_spec(myspec7, file.path(dir,"specFullTS.RData"))
 # Save model from a c("SA","TRAMO_SEATS") class object
save_spec(mysa7, file.path(dir,"saTS.RData"))

 # Load the model specification
myspec2a <- load_spec(file.path(dir,"specx13.RData"))
myspec2b <- load_spec(file.path(dir,"regx13.RData"))
myspec4a <- load_spec(file.path(dir,"specTS.RData"))
myspec4b <- load_spec(file.path(dir,"regTS.RData"))
myspec6a <- load_spec(file.path(dir,"specFullx13.RData"))
myspec6b <- load_spec(file.path(dir,"sax13.RData"))
myspec7a <- load_spec(file.path(dir,"specFullTS.RData"))
myspec7b <- load_spec(file.path(dir,"saTS.RData"))


regarima(myseries, myspec2a)
x13(myseries, myspec6a)
tramoseats(myseries, myspec7a)

regarima(myseries, myspec4a)
x13(myseries, myspec6b)
tramoseats(myseries, myspec7b)
## End(No test)



