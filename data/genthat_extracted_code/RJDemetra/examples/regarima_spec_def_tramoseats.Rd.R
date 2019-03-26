library(RJDemetra)


### Name: regarima_spec_def_tramoseats
### Title: RegARIMA model specification, pre-adjustment in TRAMO-SEATS
### Aliases: regarima_spec_def_tramoseats regarima_spec_tramoseats

### ** Examples

## No test: 
myseries <- ipi_c_eu[, "FR"]
myspec1 <- regarima_spec_def_tramoseats(spec = "TRfull")
myreg1 <- regarima(myseries, spec = myspec1)

 # Modify a pre-specified model specification
myspec2 <- regarima_spec_def_tramoseats(spec = "TRfull",
             tradingdays.mauto = "Unused",
             tradingdays.option = "WorkingDays",
             easter.type = "Standard",
             automdl.enabled = FALSE, arima.mu = TRUE)
myreg2 <- regarima(myseries, spec = myspec2)

 # Modify the model specification from a "regarima" object
myspec3 <- regarima_spec_tramoseats(myreg1,
             tradingdays.mauto = "Unused",
             tradingdays.option = "WorkingDays",
             easter.type = "Standard", automdl.enabled = FALSE,
             arima.mu = TRUE)
myreg3 <- regarima(myseries, myspec3)

 # Modify the model specification from a "regarima_spec" object
myspec4 <- regarima_spec_tramoseats(myspec1,
             tradingdays.mauto = "Unused",
             tradingdays.option = "WorkingDays",
             easter.type = "Standard",
             automdl.enabled = FALSE, arima.mu = TRUE)
myreg4 <- regarima(myseries, myspec4)

 # Pre-specified outliers
myspec1 <- regarima_spec_def_tramoseats(spec = "TRfull",
             usrdef.outliersEnabled = TRUE,
             usrdef.outliersType = c("LS", "LS"),
             usrdef.outliersDate = c("2008-10-01" ,"2003-01-01"),
             usrdef.outliersCoef = c(10, -8), transform.function = "None")
s_preOut(myspec1)
myreg1 <- regarima(myseries, myspec1)
myreg1
s_preOut(myreg1)


 # User-defined variables
var1 <- ts(rnorm(length(myseries))*10, start = start(myseries),
           frequency = 12)
var2 <- ts(rnorm(length(myseries))*100, start = start(myseries),
           frequency = 12)
var <- ts.union(var1, var2)

myspec1 <- regarima_spec_def_tramoseats(spec = "TRfull",
            usrdef.varEnabled = TRUE, usrdef.var = var)
s_preVar(myspec1)
myreg1 <- regarima(myseries,myspec1)

myspec2 <- regarima_spec_def_tramoseats(spec = "TRfull",
             usrdef.varEnabled = TRUE,
             usrdef.var = var, usrdef.varCoef = c(17,-1),
             transform.function = "None")
myreg2 <- regarima(myseries, myspec2)

 # Pre-specified ARMA coefficients
myspec1 <- regarima_spec_def_tramoseats(spec = "TRfull",
             arima.coefEnabled = TRUE, automdl.enabled = FALSE,
             arima.p = 2, arima.q = 0, arima.bp = 1, arima.bq = 1,
             arima.coef = c(-0.12, -0.12, -0.3, -0.99),
             arima.coefType = rep("Fixed", 4))
myreg1 <- regarima(myseries, myspec1)
myreg1
summary(myreg1)
s_arimaCoef(myspec1)
s_arimaCoef(myreg1)
## End(No test)



