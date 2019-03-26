library(VGAMextra)


### Name: summaryS4VGAMextra-methods
### Title: Summary methods for Vector Generalized Time Series Models
### Aliases: summaryS4VGAMextra 'summaryS4VGAMextra, vgltsmff-method'

### ** Examples


## No test: 
#------------------------------------------------------------------------#
# Fitting a simple Moving Average model to compare with arima().
#------------------------------------------------------------------------#
set.seed(0628)
nn    <- 300
theta <- c(0.2, -0.37)  # Autoregressive coefficients
phi   <- c(0.25)        # MA coefficients.
mu    <- c(1.5, 0.85)   # Mean (not drift) of the MA process.
x2 <- runif(nn)

tsd1 <- mu[1]/(1 - sum(theta)) + 
                  arima.sim(n = nn, 
                            model = list(order = c(2, 0, 0), 
                                          ar = theta),
                            sd = exp(1.5))
tsd2 <- mu[2]/(1 - sum(theta)) + 
                  arima.sim(n = nn, 
                            model = list(order = c(2, 0, 1),
                                         ar = theta, ma = phi), 
                            sd = exp(1 + 2 * x2))

tsdata <- data.frame(TS1 = tsd1, TS2 = tsd2, x2 = x2)
head(tsdata)

    ###    An ARIMA(2, 0, 0) model, that is an AR(2) model    ###
    
fit1 <- vglm(TS1 ~ 1, 
             ARIMAXff(order = c(2, 0, 0), type.likelihood = "exact",
                     var.arg = FALSE, type.EIM = "exact"), 
             data = tsdata,  crit = "log", trace = TRUE)

m.coe <- Coef(fit1)

## Using arima to compare to summary(vgtsff)
summary(fit1)
arima(tsdata$TS1, order = c(2, 0, 0)) ## Similar SE's than VGAMextra.


m.coe[1] / (1 - sum(m.coe[-(1:2)]))  # THIS IS SIMILAR TO THE INTERCEPT 
                                     # ESTIMATED BY arima(): 1.1898

    ###    An ARIMA(2, 0, 1) models, that is an ARMA(2, 1)     ###
    ###   The errors standard deviation is a function of 'x2'  ###

### NOTICE: ARIMA and ARMA use the "identitylink" for coefficients ###
fit2 <- vglm(TS2 ~ x2, 
             ARIMAXff(order = c(2, 0, 1), type.likelihood = "exact",
                     var.arg = FALSE, type.EIM = "exact",
                     zero = NULL), 
            constraints = list('x2' = rbind(0, 1, 0, 0, 0)),
             data = tsdata,  crit = "loglikelihood", trace = TRUE)

m.coe <- coef(fit2)
coef(fit2, matrix = TRUE)

## Compare summary(vglm) to arima().
summary(fit2)
arima(tsdata$TS2, order = c(2, 0, 1))

## End(No test)




