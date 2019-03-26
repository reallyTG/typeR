library(RJDemetra)


### Name: specification
### Title: Access model specification, SA and pre-adjustment in X13 and
###   TRAMO-SEATS
### Aliases: specification s_estimate s_transform s_usrdef s_preOut
###   s_preVar s_td s_easter s_out s_arima s_arimaCoef s_fcst s_span s_x11
###   s_seats

### ** Examples

## No test: 
myseries <- ipi_c_eu[, "FR"]
myreg1 <- regarima_def_x13(myseries, spec = "RG5c")
myspec1 <- regarima_spec_x13(myreg1,
             estimate.from = "2005-10-01",
             outlier.from = "2010-03-01")

s_estimate(myreg1)
s_estimate(myspec1)

s_transform(myreg1)
s_transform(myspec1)

s_usrdef(myreg1)
s_usrdef(myspec1)

myspec2 <- regarima_spec_x13(myreg1, usrdef.outliersEnabled = TRUE,
             usrdef.outliersType = c("LS", "AO"),
             usrdef.outliersDate = c("2009-10-01", "2005-02-01"))
myreg2 <- regarima(myseries, myspec2)

s_preOut(myreg2)
s_preOut(myspec2)

var1 <- ts(rnorm(length(myseries))*10, start = start(myseries), frequency = 12)
var2 <- ts(rnorm(length(myseries))*100, start = start(myseries), frequency = 12)
var3 <- ts.union(var1, var2)
myspec3 <- regarima_spec_def_x13(spec = "RG5c",
                                 usrdef.varEnabled = TRUE,
                                 usrdef.var = var3)
myreg3 <- regarima(myseries, myspec3)

s_preVar(myspec3)
s_preVar(myreg3)

s_td(myreg1)
s_td(myspec1)

s_easter(myreg1)
s_easter(myspec1)

s_out(myreg1)
s_out(myspec1)

s_arima(myreg1)
s_arima(myspec1)

myspec4 <- regarima_spec_x13(myreg1, automdl.enabled = FALSE,
             arima.coefEnabled = TRUE,
             arima.p = 1,arima.q = 1, arima.bp = 1, arima.bq = 1,
             arima.coef = rep(0.2, 4),
             arima.coefType = rep("Initial", 4))
myreg4 <- regarima(myseries, myspec4)

s_arimaCoef(myreg4)
s_arimaCoef(myspec4)

s_fcst(myreg1)
s_fcst(myspec1)

s_span(myreg1)
s_span(myspec1)

myspec5 <- x13_spec_def(spec = "RSA5c", x11.seasonalComp = FALSE)
mysa5 <- x13(myseries, myspec5)

s_x11(mysa5)
s_x11(myspec5)

myspec6 <- tramoseats_spec_def(spec = c("RSAfull"), seats.approx = "Noisy")
mysa6 <- tramoseats(myseries, myspec6)

s_seats(mysa6)
s_seats(mysa6)
## End(No test)



