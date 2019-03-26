library(RJDemetra)


### Name: regarima
### Title: RegARIMA model, pre-adjustment in X13 and TRAMO-SEATS
### Aliases: regarima regarima_def_tramoseats regarima_def_x13

### ** Examples

## No test: 
 # X13 method
myseries <- ipi_c_eu[, "FR"]
myreg <- regarima_def_x13(myseries, spec ="RG5c")
summary(myreg)
plot(myreg)

myspec1 <- regarima_spec_x13(myreg, tradingdays.option = "WorkingDays")
myreg1 <- regarima(myseries, myspec1)

myspec2 <- regarima_spec_x13(myreg, usrdef.outliersEnabled = TRUE,
             usrdef.outliersType = c("LS", "AO"),
             usrdef.outliersDate = c("2008-10-01", "2002-01-01"),
             usrdef.outliersCoef = c(36, 14),
             transform.function = "None")
myreg2 <- regarima(myseries, myspec2)
myreg2

myspec3 <- regarima_spec_x13(myreg, automdl.enabled = FALSE,
             arima.p = 1, arima.q = 1,
             arima.bp = 0, arima.bq = 1,
             arima.coefEnabled = TRUE,
             arima.coef = c(-0.8, -0.6, 0),
             arima.coefType = c(rep("Fixed", 2), "Undefined"))
s_arimaCoef(myspec3)
myreg3 <- regarima(myseries, myspec3)
summary(myreg3)
plot(myreg3)

 # TRAMO-SEATS method
myspec <- regarima_spec_def_tramoseats("TRfull")
myreg <- regarima(myseries, myspec)
# This is equivalent to:
myreg1 <- regarima_def_tramoseats(myseries, spec = "TRfull")
myreg
myreg1

myspec2 <- regarima_spec_tramoseats(myspec, tradingdays.mauto = "Unused",
             tradingdays.option = "WorkingDays",
             easter.type = "Standard",
             automdl.enabled = FALSE, arima.mu = TRUE)
myreg2 <- regarima(myseries, myspec2)

var1 <- ts(rnorm(length(myseries))*10, start = start(myseries), frequency = 12)
var2 <- ts(rnorm(length(myseries))*100, start = start(myseries), frequency = 12)
var <- ts.union(var1, var2)
myspec3 <- regarima_spec_tramoseats(myspec,
             usrdef.varEnabled = TRUE, usrdef.var = var)
s_preVar(myspec3)
myreg3 <- regarima(myseries, myspec3)
myreg3
## End(No test)



