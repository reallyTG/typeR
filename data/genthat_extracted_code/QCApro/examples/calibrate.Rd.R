library(QCApro)


### Name: calibrate
### Title: Calibrate Raw Data into Configurational Data
### Aliases: calibrate
### Keywords: functions

### ** Examples

# base variable; random draw from standard normal distribution
set.seed(30)
x <- rnorm(30)

# calibration thresholds
th <- quantile(x, seq(from = 0.05, to = 0.95, length = 6))

# calibration of bivalent crisp-set factor
calibrate(x, thresholds = th[3])

# calibration of trivalent crisp-set factor
calibrate(x, thresholds = c(th[2], th[4]))

# fuzzy-set calibration
# 1. positive end-point concept, linear
# 2. positive and corresponding negative end-point concept, logistic
# 3. positive end-point concept, ECDF
# 4. negative end-point concept, s-shaped (quadratic)
# 5. negative end-point concept, inverted s-shaped (root)
# 6. positive mid-point concept, triangular
# 7. positive mid-point concept, trapezoidal
# 8. negative mid-point concept, bell-shaped

yl <- "Set Membership"
xl <- "Base Variable Value"

par(mfrow = c(2,4), cex.main = 1)

plot(x, calibrate(x, type = "fuzzy", thresholds = c(th[1], (th[3]+th[4])/2, 
   th[6])), xlab = xl, ylab = yl, 
   main = "1. positive end-point concept,\nlinear")

plot(x, calibrate(x, type = "fuzzy", thresholds = c(th[1], (th[3]+th[4])/2, 
  th[6]), logistic = TRUE, idm = 0.99), xlab = xl, ylab = yl, 
  main = "2. positive and corresponding negative\nend-point concept, logistic")
  points(x, calibrate(x, type = "fuzzy", thresholds = c(th[6], (th[3]+th[4])/2, 
    th[1]), logistic = TRUE, idm = 0.99))

plot(x, calibrate(x, type = "fuzzy", thresholds = c(th[1], (th[3]+th[4])/2, 
  th[6]), ecdf = TRUE), xlab = xl, ylab = yl, 
  main = "3. positive end-point concept,\nECDF")

plot(x, calibrate(x, type = "fuzzy", thresholds = c(th[6], (th[3]+th[4])/2, 
  th[1]), p = 2, q = 2), xlab = xl, ylab = yl, 
  main = "4. negative end-point concept,\ns-shaped (quadratic)")

plot(x, calibrate(x, type = "fuzzy", thresholds = c(th[6], (th[3]+th[4])/2, 
  th[1]), p = 0.5, q = 0.5), xlab = xl, ylab = yl, 
  main = "5. negative end-point concept,\ninverted s-shaped (root)")

plot(x, calibrate(x, type = "fuzzy", thresholds = th[c(1,2,3,3,4,5)]),
  xlab = xl, ylab = yl, main = "6. positive mid-point concept,\ntriangular")

plot(x, calibrate(x, type = "fuzzy", thresholds = th[c(1,2,3,4,5,6)]),
  xlab = xl, ylab = yl, main = "7. positive mid-point concept,\ntrapezoidal")

plot(x, calibrate(x, type = "fuzzy", thresholds = th[c(3,2,1,5,4,3)],
  p = 3, q = 3), xlab = xl, ylab = yl, 
  main = "8. negative mid-point concept,\nbell-shaped")



