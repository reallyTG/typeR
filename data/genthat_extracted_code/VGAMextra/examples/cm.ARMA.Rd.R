library(VGAMextra)


### Name: cm.ARMA
### Title: Constraint matrices for vector generalized time series family
###   functions.
### Aliases: cm.ARMA

### ** Examples


#############
# Example 1.
#############
# Constraint matrices for a TS family function (AR or MA) 
# with 6 lagged terms.
# Restriction commences at the third position (theta[3]) powered to
# or multiplied by 4. Intercept-only model.
position   <- -3
numberLags <-  6
myfactor   <-  4
cm.ARMA(offset = position, lags.cm = numberLags, factorSeq = myfactor)

# With one covariate
cm.ARMA(Model =  ~ x2, offset = position, 
        lags.cm = numberLags, factorSeq = myfactor)

## No test: 
# Or 2 responses...
cm.ARMA(offset = position, lags.cm = numberLags, 
        factorSeq = myfactor, Resp = 2)


# The following call causes an ERROR.
cm.ARMA(offset = -1, lags.cm = 6, factorSeq = 2)
## End(No test)

##############
# Example 2.
##############

# In this example, the use of constraints via 'cm.ARMA()' is
# included in the 'vglm' call. Here, two AR(2) models are fitted
# in the same call (i.e. two responses), where different constraints
# are set, as follows:
# a) list(ar = c(theta1, theta1^2)) and
# b) list(ar = c(theta2, theta2^2 )).

# 2.0 Generate the data.
set.seed(1001)
nn     <- 100
# A single covariate.
covdata <- data.frame(x2 =  runif(nn)) 

theta1 <- 0.40; theta2 <- 0.55
drift  <- c(0.5, 0.75)
sdAR   <- c(sqrt(2.5), sqrt(2.0))

# Generate AR sequences, TS1 and TS2, considering Gaussian white noise

# Save both in a data.frame object: the data.
tsdata  <- 
  data.frame(covdata, # Not used 
             TS1 = arima.sim(nn, 
                             model = list(ar = c(theta1, theta1^2)), 
                             rand.gen = rnorm, 
                             mean = drift[1], sd = sdAR[1]),
             TS2 = arima.sim(nn, 
                             model = list(ar = c(theta2, theta2^2)), 
                             rand.gen = rnorm, 
                             mean = drift[2], sd = sdAR[2]))

# 2.1 Fitting both time series with 'ARXff'... multiple responses case.
fit1 <- vglm(cbind(TS1, TS2) ~ 1, 
             ARXff(order = c(2, 2), type.EIM = "exact"), 
             data = tsdata,  
             trace = TRUE)

Coef(fit1)                
coef(fit1, matrix = TRUE)
summary(fit1)

## Same length for both vectors, i.e. no constraints.
length(Coef(fit1))
length(coef(fit1, matrix = TRUE))




###2.2 Now, fit the same models with suitable constraints via 'cm.ARMA()'
# Most importantly, "loge" is used as link function to adequately match 
# the relationship between coefficients and constraints. That is:
# theta2 = theta1^2, then log(theta2) = 2 * log(theta1).

fit2 <- vglm(cbind(TS1, TS2) ~ 1, 
             ARXff(order = c(2, 2), type.EIM = "exact", lARcoeff = "loge"), 
             constraints = cm.ARMA(Model = ~ 1, 
                                   Resp = 2,
                                   lags.cm = c(2, 2),
                                   offset  = -2),
             data = tsdata,  
             trace = TRUE)
Coef(fit2)
coef(fit2, matrix = TRUE)
summary(fit2)

# NOTE, for model 1, Coeff2 = Coeff1^2, then log(Coeff2) = 2 * log(Coeff1)
( mycoef <- coef(fit2, matrix = TRUE)[c(3, 4)] )
2 * mycoef[1] - mycoef[2]    # SHOULD BE ZERO

# Ditto for model 2: 
( mycoef <- coef(fit2, matrix = TRUE)[c(7, 8)] )
2 * mycoef[1] - mycoef[2]    # SHOULD BE ZERO

## Different lengths, due to constraints
length(Coef(fit2))
length(coef(fit2, matrix = TRUE))

 



