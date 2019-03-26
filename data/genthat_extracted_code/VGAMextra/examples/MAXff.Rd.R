library(VGAMextra)


### Name: MAXff
### Title: VGLTSMs Family Functions: Order-q Moving Average Model with
###   covariates
### Aliases: MAXff

### ** Examples

set.seed(2)
nn    <- 130
### Coefficients
phi1  <-  0.34; phi2 <- -1.19; phi3 <- 0.26
### Intercept
mu    <- c(-1.4, 2.3)
### Noise standar deviations (Two responses)
sdMA  <- c(sqrt(6.5), sqrt(4.0))
### A single covariate.
Xcov <- runif(nn)

# Generating two MA processes, TS1 and TS2, Gaussian noise.
# Note, the SD noise for TS2 is function of Xcov.

y1   <- mu[1] + arima.sim(nn, 
                          model = list( ma = c(phi1, phi1^2)), 
                          rand.gen = rnorm, sd = exp(sdMA[1]) ) 
y2   <- mu[2] + arima.sim(nn, 
                          model = list( ma = c(phi1, phi2, phi3) ), 
                          rand.gen = rnorm, sd = exp(Xcov + sdMA[2]) )
# OUR DATA
tsdata <- data.frame(x2 = Xcov , TS1 = y1, TS2 = y2)

#------------------------------------------------------------------------#
# 1. A simple MA(3) to compare with 'arima()'.

myfit0 <- vglm(TS1 ~ 1,
               MAXff(order = 3, type.EIM = "exact",
                    var.arg = FALSE),
               #constraints = cm.ARMA(Model = ~ 1, 
               #                      lags.cm = 2, 
               #                      Resp = 1),
               data = tsdata, trace = TRUE) 

Coef(myfit0)[c(3, 4, 1)]
fitArima <- arima(tsdata$TS1, order = c(0, 0, 2)) 
coef(fitArima)

AIC(myfit0); BIC(myfit0)

# ------------------------------------------------------------------------#
# 2. Estimate an MA(3), intercept-only, using initial values.

myfit <- vglm(TS2 ~ 1,
              MAXff(order = 3, type.EIM = c("exact", "approx")[1],
                   # Optional initial values.
                    imean = 3,
                    iMAcoeff = c(0.3, -0.2, 0.25),
                   var.arg = TRUE),
              data = tsdata, trace = TRUE)

Coef(myfit)
summary(myfit)
constraints(myfit)


#----------------------------------------#
# Same model fitted using arima()
#----------------------------------------#

fitArima <- arima(tsdata$TS2, order = c(0, 0, 3)) 
coef(fitArima)


#------------------------------------------------------------------------#
# 3. An MAX(3) with one covariate, testing its effect over the
#    standard deviation of the Gaussian noise. Note the 'zero' argument.

myfit1 <- vglm(TS2 ~ x2,
               # Or Multiple responses! 
               # cbind(TS1, TS2) ~ 1,
               MAXff(order = 3, type.EIM = "exact", xLag = 1,
                    # Optional initial values:
                    # idev.mean = 1.4, 
                    # iMAcoeff = c(2.3, -1.2, 0.25), isd = 1.6,
                    
                    # NOTE THE ZERO ARGUMENT:
                    zero = c("Mean", "MAcoeff"),
                    
                    var.arg = TRUE),
               data = tsdata, trace = TRUE)

coef(myfit1, matrix = TRUE) 
summary(myfit1)
vcov(myfit1)

constraints(myfit1)

#------------------------------------------------------------------------#
# Model above CANNOT be fitted using arima()
#------------------------------------------------------------------------#




