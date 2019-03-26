library(RJDemetra)


### Name: tramoseats_spec_def
### Title: TRAMO-SEATS model specification, SA/TRAMO-SEATS
### Aliases: tramoseats_spec_def tramoseats_spec

### ** Examples

## No test: 
myseries <- ipi_c_eu[, "FR"]
myspec1 <- tramoseats_spec_def(spec = c("RSAfull"))
mysa1 <- tramoseats(myseries, spec = myspec1)

# Modify a pre-specified model specification
myspec2 <- tramoseats_spec_def(spec = "RSAfull", tradingdays.mauto = "Unused",
                               tradingdays.option = "WorkingDays",
                               easter.type = "Standard",
                               automdl.enabled = FALSE, arima.mu = TRUE)
mysa2 <- tramoseats(myseries, spec = myspec2)

# Modify the model specification from a "SA" object
myspec3 <- tramoseats_spec(mysa1, tradingdays.mauto = "Unused",
                           tradingdays.option = "WorkingDays",
                           easter.type = "Standard", automdl.enabled = FALSE, arima.mu = TRUE)
mysa3 <- tramoseats(myseries, myspec3)

# Modify the model specification from a "SA_spec" object
myspec4 <- tramoseats_spec(myspec1, tradingdays.mauto = "Unused",
                           tradingdays.option = "WorkingDays",
                           easter.type = "Standard", automdl.enabled = FALSE, arima.mu = TRUE)
mysa4 <- tramoseats(myseries, myspec4)

# Pre-specified outliers
myspec5 <- tramoseats_spec_def(spec = "RSAfull",
                               usrdef.outliersEnabled = TRUE,
                               usrdef.outliersType = c("LS", "LS"),
                               usrdef.outliersDate = c("2008-10-01", "2003-01-01"),
                               usrdef.outliersCoef = c(10,-8), transform.function = "None")
s_preOut(myspec5)
mysa5 <- tramoseats(myseries, myspec5)
mysa5
s_preOut(mysa5)

# User-defined variables
var1 <- ts(rnorm(length(myseries))*10, start = start(myseries), frequency = 12)
var2 <- ts(rnorm(length(myseries))*100, start = start(myseries), frequency = 12)
var<- ts.union(var1, var2)

myspec6 <- tramoseats_spec_def(spec = "RSAfull",
                              usrdef.varEnabled = TRUE, usrdef.var = var)
s_preVar(myspec6)
mysa6 <- tramoseats(myseries, myspec6)

myspec7 <- tramoseats_spec_def(spec = "RSAfull", usrdef.varEnabled = TRUE,
                               usrdef.var = var, usrdef.varCoef = c(17,-1),
                               transform.function = "None")
mysa7 <- tramoseats(myseries, myspec7)

# Pre-specified ARMA coefficients
myspec8 <- tramoseats_spec_def(spec = "RSAfull",
                               arima.coefEnabled = TRUE, automdl.enabled = FALSE,
                               arima.p = 2, arima.q = 0,
                               arima.bp = 1, arima.bq = 1,
                               arima.coef = c(-0.12, -0.12, -0.3, -0.99),
                               arima.coefType = rep("Fixed", 4))
mysa8 <- tramoseats(myseries, myspec8)
mysa8
s_arimaCoef(myspec8)
s_arimaCoef(mysa8)
## End(No test)



