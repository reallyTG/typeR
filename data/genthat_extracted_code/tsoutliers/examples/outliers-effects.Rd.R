library(tsoutliers)


### Name: outliers.effects
### Title: Create the Pattern of Different Types of Outliers
### Aliases: outliers.effects
### Keywords: ts

### ** Examples

n <- 30
# innovative outlier based on ARMA(3, 2) model
mo <- outliers("IO", 10)
io <- outliers.effects(mo, n, pars = list(arcoefs = c(0.8, -0.6, 0.2), 
  macoefs = c(-0.5, 0.2)))
plot(c(io[seq.int(10)], rep(NA, 20)), type = "s", ylim = range(io), 
  ylab = "io", main = "IO based on ARMA(3,2)")
lines(c(rep(NA, 9), io[-seq.int(9)]))

# innovative outlier based on Airlines model ARIMA(0,1,1)(0,1,1)
p1 <- c(1, -1)
p2 <- c(1, rep(0, 3), -1)
p1xp2 <- c(1, -1, 0, 0, -1, 1)
p1b <- c(1, -0.6)
p2b <- c(1, rep(0, 3), -0.6)
p2bxp2b <- c(1, -0.6, 0, 0, -0.6, 0.36)
io2 <- outliers.effects(mo, n, pars = list(arcoefs = -p1xp2[-1], 
  macoefs = p2bxp2b[-1]))
plot(c(io2[seq.int(10)], rep(NA, 20)), type = "s", ylim = range(io2), 
  main = "IO based on ARIMA(0,1,1)(0,1,1)", ylab = "io2")
lines(c(rep(NA, 9), io2[-seq.int(9)]))

# additive outlier
mo <- outliers("AO", 10)
ao <- outliers.effects(mo, n)
plot(ao, type = "h", main = "AO: additive outlier")

# level shift
mo <- outliers("LS", 10)
ls <- outliers.effects(mo, n)
plot(ls, type = "s", main = "LS: level shift")

# temporary change
mo <- outliers("TC", 10)
tc <- outliers.effects(mo, n)
plot(c(tc[seq.int(10)], rep(NA, 20)), type = "s", 
  main = "TC: temporary change", ylab = "tc")
lines(c(rep(NA, 9), tc[-seq.int(9)]))

# the temporary change with parameter 0.7 is equivalent to 
# an IO for an AR(1) model with coefficient 0.7
mo <- outliers("IO", 10)
io3 <- outliers.effects(mo, n = n, pars = list(arcoefs = c(0.7), macoefs = c(0)))
all.equal(io3, tc, check.attributes=FALSE)

# the temporary change with parameter 0.7 is equivalent to 
# an IO for an AR(1) model with coefficient 0.7
mo <- outliers("IO", 10)
io4 <- outliers.effects(mo, n = n, pars = list(arcoefs = 1, macoefs = 0))
all.equal(io4, ls, check.attributes=FALSE)

# seasonal level shift (quarterly data)
mo <- outliers("SLS", 10)
sls <- outliers.effects(mo, n, freq = 4)
plot(sls, type = "h", main = "SLS: seasonal level shift")



