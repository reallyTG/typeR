library(RJDemetra)


### Name: x13
### Title: Seasonal Adjustment with X-13ARIMA-SEATS
### Aliases: x13 x13_def

### ** Examples

## No test: 
myseries <- ipi_c_eu[, "FR"]
mysa <- x13_def(myseries, spec = "RSA5c")

myspec1 <- x13_spec(mysa, tradingdays.option = "WorkingDays",
            usrdef.outliersEnabled = TRUE,
            usrdef.outliersType = c("LS","AO"),
            usrdef.outliersDate = c("2008-10-01", "2002-01-01"),
            usrdef.outliersCoef = c(36, 14),
            transform.function = "None")
mysa1 <- x13(myseries, myspec1)
mysa1
summary(mysa1$regarima)

myspec2 <- x13_spec(mysa, automdl.enabled =FALSE,
            arima.coefEnabled = TRUE,
            arima.p = 1, arima.q = 1, arima.bp = 0, arima.bq = 1,
            arima.coef = c(-0.8, -0.6, 0),
            arima.coefType = c(rep("Fixed", 2), "Undefined"))
s_arimaCoef(myspec2)
mysa2 <- x13(myseries, myspec2,
             userdefined = c("decomposition.d18", "decomposition.d19"))
mysa2
plot(mysa2)
plot(mysa2$regarima)
plot(mysa2$decomposition)
## End(No test)



