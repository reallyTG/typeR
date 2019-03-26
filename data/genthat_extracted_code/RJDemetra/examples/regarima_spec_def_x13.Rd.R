library(RJDemetra)


### Name: regarima_spec_def_x13
### Title: RegARIMA model specification, pre-adjustment in X13
### Aliases: regarima_spec_def_x13 regarima_spec_x13

### ** Examples

## No test: 
myseries <- ipi_c_eu[, "FR"]
myspec1 <- regarima_spec_def_x13(spec = "RG5c")
myreg1 <- regarima(myseries, spec = myspec1)

 # Modify a pre-specified model specification
myspec2 <- regarima_spec_def_x13(spec = "RG5c",
                                 tradingdays.option = "WorkingDays")
myreg2 <- regarima(myseries, spec = myspec2)

 # Modify the model specification from a "regarima" object
myspec3 <- regarima_spec_x13(myreg1, tradingdays.option = "WorkingDays")
myreg3 <- regarima(myseries, myspec3)

 # Modify the model specification from a "regarima_spec" object
myspec4 <- regarima_spec_x13(myspec1, tradingdays.option = "WorkingDays")
myreg4 <- regarima(myseries, myspec4)

 # Pre-specified outliers
myspec1 <- regarima_spec_def_x13(spec = "RG5c", usrdef.outliersEnabled = TRUE,
              usrdef.outliersType = c("LS", "AO"),
              usrdef.outliersDate = c("2008-10-01", "2002-01-01"),
              usrdef.outliersCoef = c(36, 14),
              transform.function = "None")

myreg1 <- regarima(myseries, myspec1)
myreg1
s_preOut(myreg1)


 # User-defined variables
var1 <- ts(rnorm(length(myseries))*10, start = start(myseries),
           frequency = 12)
var2 <- ts(rnorm(length(myseries))*100, start = start(myseries),
           frequency = 12)
var <- ts.union(var1, var2)

myspec1 <- regarima_spec_def_x13(spec = "RG5c", usrdef.varEnabled = TRUE,
                                 usrdef.var = var)
myreg1 <- regarima(myseries, myspec1)
myreg1

myspec2 <- regarima_spec_def_x13(spec="RG5c", usrdef.varEnabled = TRUE,
                                 usrdef.var = var1, usrdef.varCoef = 2,
                                 transform.function = "None")
myreg2 <- regarima(myseries, myspec2)
s_preVar(myreg2)

 # Pre-specified ARMA coefficients
myspec1 <- regarima_spec_def_x13(spec="RG5c", automdl.enabled =FALSE,
             arima.p = 1, arima.q = 1, arima.bp = 0, arima.bq = 1,
             arima.coefEnabled = TRUE, arima.coef = c(-0.8, -0.6, 0),
             arima.coefType = c(rep("Fixed", 2), "Undefined"))

s_arimaCoef(myspec1)
myreg1 <- regarima(myseries, myspec1)
myreg1
## End(No test)



