## ---- SETTINGS-knitr, include=FALSE--------------------------------------
library(bayesDP)
stopifnot(require(knitr))
opts_chunk$set(
  #comment = NA,
  #message = FALSE,
  #warning = FALSE,
  #eval = if (isTRUE(exists("params"))) params$EVAL else FALSE,
  dev = "png",
  dpi = 150,
  fig.asp = 0.8,
  fig.width = 5,
  out.width = "60%",
  fig.align = "center"
  )

set.seed(42)  
fit01 <- bdpbinomial(y_t=10, N_t=500, y0_t=25, N0_t=250, method="fixed")
fit02 <- bdpbinomial(y_t=10, N_t=500, y0_t=10, N0_t=250, method="fixed",
                     discount_function="weibull")

fit_scaledweibull <- bdpbinomial(y_t=10, N_t=500, y0_t=25, N0_t=250, 
                                 discount_function="scaledweibull",
                                 method="fixed")
fit_identity <- bdpbinomial(y_t=10, N_t=500, y0_t=10, N0_t=250,
                            method="fixed")

## ---- echo=FALSE---------------------------------------------------------
df2 <- plot(fit_identity, type="discount", print=FALSE)
df2 + ggtitle("Discount function plot", "Identity")

## ---- echo=FALSE---------------------------------------------------------
df1 <- plot(fit02, type="discount", print=FALSE)
df1 + ggtitle("Discount function plot", "Weibull distribution with shape=3 and scale=0.135")

## ------------------------------------------------------------------------
p1 <- plot(fit02, type="discount", print=FALSE)
p1 + ggtitle("Discount Function Plot :-)")

## ------------------------------------------------------------------------
set.seed(42)
### Simulate  data
# Sample sizes
n_t  <- 30     # Current treatment sample size
n_c  <- 30     # Current control sample size
n_t0 <- 80     # Historical treatment sample size
n_c0 <- 80     # Historical control sample size

# Treatment group vectors for current and historical data
treatment   <- c(rep(1,n_t), rep(0,n_c))
treatment0  <- c(rep(1,n_t0), rep(0,n_c0))

# Simulate a covariate effect for current and historical data
x  <- rnorm(n_t+n_c, 1, 5)
x0 <- rnorm(n_t0+n_c0, 1, 5)

# Simulate outcome:
# - Intercept of 10 for current and historical data
# - Treatment effect of 31 for current data
# - Treatment effect of 30 for historical data
# - Covariate effect of 3 for current and historical data
Y  <- 10 + 31*treatment  + x*3 + rnorm(n_t+n_c,0,5)
Y0 <- 10 + 30*treatment0 + x0*3 + rnorm(n_t0+n_c0,0,5)

# Place data into separate treatment and control data frames and
# assign historical = 0 (current) or historical = 1 (historical)
df_ <- data.frame(Y=Y, treatment=treatment, x=x)
df0 <- data.frame(Y=Y0, treatment=treatment0, x=x0)

# Fit model using default settings
fit <- bdplm(formula=Y ~ treatment+x, data=df_, data0=df0,
             method="fixed")

summary(fit)
print(fit)
#plot(fit)   <-- Not yet implemented

