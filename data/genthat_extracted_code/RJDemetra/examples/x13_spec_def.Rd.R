library(RJDemetra)


### Name: x13_spec_def
### Title: X-13ARIMA-SEATS model specification, SA/X13
### Aliases: x13_spec_def x13_spec

### ** Examples

## No test: 
myseries <- ipi_c_eu[, "FR"]
myspec1 <- x13_spec_def(spec = "RSA5c")
myreg1 <- x13(myseries, spec = myspec1)

# Modify a pre-specified model specification
myspec2 <- x13_spec_def(spec = "RSA5c", tradingdays.option = "WorkingDays")
myreg2 <- x13(myseries, spec = myspec2)

# Modify the model specification from a "X13" object
 myspec3 <- x13_spec(myreg1, tradingdays.option = "WorkingDays")
 myreg3 <- x13(myseries, myspec3)

# Modify the model specification from a "X13_spec" object
 myspec4 <- x13_spec(myspec1, tradingdays.option = "WorkingDays")
 myreg4 <- x13(myseries, myspec4)

# Pre-specified outliers
 myspec1 <- x13_spec_def(spec = "RSA5c", usrdef.outliersEnabled = TRUE,
             usrdef.outliersType = c("LS", "AO"),
             usrdef.outliersDate = c("2008-10-01", "2002-01-01"),
             usrdef.outliersCoef = c(36, 14),
             transform.function = "None")

 myreg1 <- x13(myseries, myspec1)
 myreg1
 s_preOut(myreg1)


# User-defined variables
 var1 <- ts(rnorm(length(myseries))*10, start = start(myseries), frequency = 12)
 var2 <- ts(rnorm(length(myseries))*100, start = start(myseries), frequency = 12)
 var <- ts.union(var1, var2)
 myspec1 <- x13_spec_def(spec = "RSA5c", usrdef.varEnabled = TRUE,
                         usrdef.var = var)
 myreg1 <- x13(myseries, myspec1)
 myreg1

 myspec2 <- x13_spec_def(spec = "RSA5c", usrdef.varEnabled = TRUE,
             usrdef.var = var1, usrdef.varCoef = c(2),
             transform.function = "None")
 myreg2 <- x13(myseries, myspec2)
 s_preVar(myreg2)

# Pre-specified ARMA coefficients
 myspec1 <- x13_spec_def(spec = "RSA5c", automdl.enabled = FALSE,
             arima.p = 1, arima.q = 1, arima.bp = 0, arima.bq = 1,
             arima.coefEnabled = TRUE,
             arima.coef = c(-0.8, -0.6, 0),
             arima.coefType = c(rep("Fixed", 2), "Undefined"))

 s_arimaCoef(myspec1)
 myreg1 <- x13(myseries, myspec1)
 myreg1

# Defined seasonal filters
 myspec1 <- x13_spec_def("RSA5c", x11.seasonalma = rep("S3X1", 12))
 mysa1 <- x13(myseries, myspec1)
## End(No test)



