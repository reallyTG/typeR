library(VGAM)


### Name: AR1
### Title: Autoregressive Process with Order-1 Family Function
### Aliases: AR1
### Keywords: models regression

### ** Examples

### Example 1: using  arima.sim() to generate a 0-mean stationary time series.
nn <- 500
tsdata <- data.frame(x2 =  runif(nn))
ar.coef.1 <- rhobit(-1.55, inverse = TRUE)  # Approx -0.65
ar.coef.2 <- rhobit( 1.0, inverse = TRUE)   # Approx  0.50
set.seed(1)
tsdata  <- transform(tsdata,
              index = 1:nn,
              TS1 = arima.sim(nn, model = list(ar = ar.coef.1),
                              sd = exp(1.5)),
              TS2 = arima.sim(nn, model = list(ar = ar.coef.2),
                              sd = exp(1.0 + 1.5 * x2)))

### An autoregressive intercept--only model.   ###
### Using the exact EIM, and "nodrift = TRUE"  ###
fit1a <- vglm(TS1 ~ 1, data = tsdata, trace = TRUE,
              AR1(var.arg = FALSE, nodrift = TRUE,
                  type.EIM = "exact",
                  print.EIM = FALSE),
              crit = "coefficients")
Coef(fit1a)
summary(fit1a)

## Not run: 
##D ### Two responses. Here, the white noise standard deviation of TS2   ###
##D ### is modelled in terms of 'x2'. Also, 'type.EIM = exact'.  ###
##D fit1b <- vglm(cbind(TS1, TS2) ~ x2,
##D               AR1(zero = NULL, nodrift = TRUE,
##D                   var.arg = FALSE,
##D                   type.EIM = "exact"),
##D               constraints = list("(Intercept)" = diag(4),
##D                                  "x2" = rbind(0, 0, 1, 0)),
##D               data = tsdata, trace = TRUE, crit = "coefficients")
##D coef(fit1b, matrix = TRUE)
##D summary(fit1b)
##D 
##D ### Example 2: another stationary time series
##D nn     <- 500
##D my.rho <- rhobit(1.0, inverse = TRUE)
##D my.mu  <- 1.0
##D my.sd  <- exp(1)
##D tsdata  <- data.frame(index = 1:nn, TS3 = runif(nn))
##D 
##D set.seed(2)
##D for (ii in 2:nn)
##D   tsdata$TS3[ii] <- my.mu/(1 - my.rho) +
##D                     my.rho * tsdata$TS3[ii-1] + rnorm(1, sd = my.sd)
##D tsdata <- tsdata[-(1:ceiling(nn/5)), ]  # Remove the burn-in data:
##D 
##D ### Fitting an AR(1). The exact EIMs are used.
##D fit2a <- vglm(TS3 ~ 1, AR1(type.likelihood = "exact",  # "conditional",
##D                                 type.EIM = "exact"),
##D               data = tsdata, trace = TRUE, crit = "coefficients")
##D 
##D Coef(fit2a)
##D summary(fit2a)      # SEs are useful to know
##D 
##D Coef(fit2a)["rho"]    # Estimate of rho, for intercept-only models
##D my.rho                # The 'truth' (rho)
##D Coef(fit2a)["drift"]  # Estimate of drift, for intercept-only models
##D my.mu /(1 - my.rho)   # The 'truth' (drift)
## End(Not run)



