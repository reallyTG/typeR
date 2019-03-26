library(fRegression)


### Name: RegressionTestsInterface
### Title: Regression Tests
### Aliases: RegressionTestsInterface lmTest bgTest bpTest dwTest gqTest
###   harvTest hmcTest rainTest resetTest
### Keywords: htest

### ** Examples

## bg | dw -
   # Generate a Stationary and an AR(1) Series:
   x = rep(c(1, -1), 50)
   y1 = 1 + x + rnorm(100)
   # Perform Breusch-Godfrey Test for 1st order serial correlation:
   lmTest(y1 ~ x, "bg")
   # ... or for fourth order serial correlation:
   lmTest(y1 ~ x, "bg", order = 4)    
   # Compare with Durbin-Watson Test Results:
   lmTest(y1 ~ x, "dw")
   y2 = filter(y1, 0.5, method = "recursive")
   lmTest(y2 ~ x, "bg") 
   
## bp -
   # Generate a Regressor:
   x = rep(c(-1, 1), 50)
   # Generate heteroskedastic and homoskedastic Disturbances
   err1 = rnorm(100, sd = rep(c(1, 2), 50))
   err2 = rnorm(100)
   # Generate a Linear Relationship:
   y1 = 1 + x + err1
   y2 = 1 + x + err2
   # Perform Breusch-Pagan Test
   bp = lmTest(y1 ~ x, "bp")
   bp
   # Calculate Critical Value for 0.05 Level
   qchisq(0.95, bp$parameter)
   lmTest(y2 ~ x, "bp")
   
## dw -
   # Generate two AR(1) Error Terms 
   # with parameter rho = 0 (white noise) 
   # and rho = 0.9 respectively
   err1 = rnorm(100)
   # Generate Regressor and Dependent Variable
   x = rep(c(-1,1), 50)
   y1 = 1 + x + err1
   # Perform Durbin-Watson Test:
   lmTest(y1 ~ x, "dw")
   err2 = filter(err1, 0.9, method = "recursive")
   y2 = 1 + x + err2
   lmTest(y2 ~ x, "dw")
   
## gq -
   # Generate a Regressor:
   x = rep(c(-1, 1), 50)
   # Generate Heteroskedastic and Homoskedastic Disturbances:
   err1 = c(rnorm(50, sd = 1), rnorm(50, sd = 2))
   err2 = rnorm(100)
   # Generate a Linear Relationship:
   y1 = 1 + x + err1
   y2 = 1 + x + err2
   # Perform Goldfeld-Quandt Test:
   lmTest(y1 ~ x, "gq")
   lmTest(y2 ~ x, "gq")
   
## harv -
   # Generate a Regressor and Dependent Variable:
   x = 1:50
   y1 = 1 + x + rnorm(50)
   y2 = y1 + 0.3*x^2
   # Perform Harvey-Collier Test:
   harv = lmTest(y1 ~ x, "harv")
   harv
   # Calculate Critical Value vor 0.05 level:
   qt(0.95, harv$parameter)
   lmTest(y2 ~ x, "harv")
   
## hmc -
   # Generate a Regressor:
   x = rep(c(-1, 1), 50)
   # Generate Heteroskedastic and Homoskedastic Disturbances:
   err1 = c(rnorm(50, sd = 1), rnorm(50, sd = 2))
   err2 = rnorm(100)
   # Generate a Linear Relationship:
   y1 = 1 + x + err1
   y2 = 1 + x + err2
   # Perform Harrison-McCabe Test:
   lmTest(y1 ~ x, "hmc")
   lmTest(y2 ~ x, "hmc")
   
## rain -
   # Generate Series:
   x = c(1:30)
   y = x^2 + rnorm(30, 0, 2)
   # Perform rainbow Test
   rain = lmTest(y ~ x, "rain")
   rain
   # Compute Critical Value:
   qf(0.95, rain$parameter[1], rain$parameter[2]) 
   
## reset -
   # Generate Series:
   x = c(1:30)
   y1 = 1 + x + x^2 + rnorm(30)
   y2 = 1 + x + rnorm(30)
   # Perform RESET Test:
   lmTest(y1 ~ x , "reset", power = 2, type = "regressor")
   lmTest(y2 ~ x , "reset", power = 2, type = "regressor")          



