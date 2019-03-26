library(RJDemetra)


### Name: tramoseats
### Title: Seasonal Adjustment with TRAMO-SEATS
### Aliases: tramoseats tramoseats_def

### ** Examples

## No test: 
myseries <- ipi_c_eu[, "FR"]
myspec <- tramoseats_spec_def("RSAfull")
mysa <- tramoseats(myseries, myspec)
mysa

# Equivalent to:
mysa1 <- tramoseats_def(myseries, spec = "RSAfull")
mysa1

var1 <- ts(rnorm(length(myseries))*10, start = start(myseries), frequency = 12)
var2 <- ts(rnorm(length(myseries))*100, start = start(myseries), frequency = 12)
var <- ts.union(var1, var2)
myspec2 <- tramoseats_spec(myspec, tradingdays.mauto = "Unused",
                           tradingdays.option = "WorkingDays",
                           easter.type = "Standard",
                           automdl.enabled = FALSE, arima.mu = TRUE,
                           usrdef.varEnabled = TRUE, usrdef.var = var)
s_preVar(myspec2)
mysa2 <- tramoseats(myseries, myspec2,
                    userdefined = c("decomposition.sa_lin_f",
                                    "decomposition.sa_lin_e"))
mysa2
plot(mysa2)
plot(mysa2$regarima)
plot(mysa2$decomposition)
## End(No test)



