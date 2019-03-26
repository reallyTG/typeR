library(QCA)


### Name: calibrate
### Title: Calibrate raw data to crisp or fuzzy sets
### Aliases: calibrate
### Keywords: functions

### ** Examples


# generate heights for 100 people
# with an average of 175cm and a standard deviation of 10cm
set.seed(12345)
x <- rnorm(n = 100, mean = 175, sd = 10)


cx <- calibrate(x, type = "crisp", thresholds = 175)
plot(x, cx, main="Binary crisp set using 1 threshold",
     xlab = "Raw data", ylab = "Calibrated data", yaxt="n")
axis(2, at = 0:1)


cx <- calibrate(x, type = "crisp", thresholds = c(170, 180))
plot(x, cx, main="3 value crisp set using 2 thresholds",
     xlab = "Raw data", ylab = "Calibrated data", yaxt="n")
axis(2, at = 0:2)


# calibrate to a increasing, s-shaped fuzzy-set
cx <- calibrate(x, thresholds = "e=165, c=175, i=185")
plot(x, cx, main = "Membership scores in the set of tall people", 
     xlab = "Raw data", ylab = "Calibrated data")

     
# calibrate to an decreasing, s-shaped fuzzy-set
cx <- calibrate(x, thresholds = "i=165, c=175, e=185")
plot(x, cx, main = "Membership scores in the set of short people", 
     xlab = "Raw data", ylab = "Calibrated data")


# when not using the logistic function, linear increase
cx <- calibrate(x, thresholds = "e=165, c=175, i=185", logistic = FALSE)
plot(x, cx, main = "Membership scores in the set of tall people", 
     xlab = "Raw data", ylab = "Calibrated data")


# tweaking the parameters "below" and "above" the crossover,
# at value 3.5 approximates a logistic distribution, when e=155 and i=195
cx <- calibrate(x, thresholds = "e=155, c=175, i=195", logistic = FALSE,
      below = 3.5, above = 3.5)
plot(x, cx, main = "Membership scores in the set of tall people", 
     xlab = "Raw data", ylab = "Calibrated data")


# calibrate to a bell-shaped fuzzy set
cx <- calibrate(x, thresholds = "e1=155, c1=165, i1=175, i2=175, c2=185, e2=195",
      below = 3, above = 3)
plot(x, cx, main = "Membership scores in the set of average height",
     xlab = "Raw data", ylab = "Calibrated data")


# calibrate to an inverse bell-shaped fuzzy set
cx <- calibrate(x, thresholds = "i1=155, c1=165, e1=175, e2=175, c2=185, i2=195",
      below = 3, above = 3)
plot(x, cx, main = "Membership scores in the set of non-average height",
     xlab = "Raw data", ylab = "Calibrated data")


# the default values of "below" and "above" will produce a triangular shape
cx <- calibrate(x, thresholds = "e1=155, c1=165, i1=175, i2=175, c2=185, e2=195")
plot(x, cx, main = "Membership scores in the set of average height",
     xlab = "Raw data", ylab = "Calibrated data")


# different thresholds to produce a linear trapezoidal shape
cx <- calibrate(x, thresholds = "e1=155, c1=165, i1=172, i2=179, c2=187, e2=195")
plot(x, cx, main = "Membership scores in the set of average height",
     xlab = "Raw data", ylab = "Calibrated data")


# larger values of above and below will increase membership in or out of the set
cx <- calibrate(x, thresholds = "e1=155, c1=165, i1=175, i2=175, c2=185, e2=195",
      below = 10, above = 10)
plot(x, cx, main = "Membership scores in the set of average height",
     xlab = "Raw data", ylab = "Calibrated data")


# while extremely large values will produce virtually crisp results
cx <- calibrate(x, thresholds = "e1=155, c1=165, i1=175, i2=175, c2=185, e2=195",
      below = 10000, above = 10000)
plot(x, cx, main = "Binary crisp scores in the set of average height",
     xlab = "Raw data", ylab = "Calibrated data", yaxt="n")
axis(2, at = 0:1)
abline(v = c(165, 185), col = "red", lty = 2)

# check if crisp
round(cx, 0)


# using the empirical cumulative distribution function
# require manually setting logistic to FALSE
cx <- calibrate(x, thresholds = "e=155, c=175, i=195", logistic = FALSE,
      ecdf = TRUE)
plot(x, cx, main = "Membership scores in the set of tall people", 
     xlab = "Raw data", ylab = "Calibrated data")


## the indirect method, per capita income data from Ragin (2008)
inc <- c(40110, 34400, 25200, 24920, 20060, 17090, 15320, 13680, 11720,
         11290, 10940, 9800, 7470, 4670, 4100, 4070, 3740, 3690, 3590,
         2980, 1000, 650, 450, 110)

cinc <- calibrate(inc, method = "indirect",
        thresholds = "1000, 4000, 5000, 10000, 20000")

plot(inc, cinc, main = "Membership scores in the set of high income", 
     xlab = "Raw data", ylab = "Calibrated data")
     

# calibrating categorical data
set.seed(12345)
values <- sample(1:7, 100, replace = TRUE)

TFR <- calibrate(values, method = "TFR")

table(round(TFR, 3))



