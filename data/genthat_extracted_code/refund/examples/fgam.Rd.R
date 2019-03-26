library(refund)


### Name: fgam
### Title: Functional Generalized Additive Models
### Aliases: fgam

### ** Examples

data(DTI)
## only consider first visit and cases (no PASAT scores for controls)
y <- DTI$pasat[DTI$visit==1 & DTI$case==1]
X <- DTI$cca[DTI$visit==1 & DTI$case==1, ]
X_2 <- DTI$rcst[DTI$visit==1 & DTI$case==1, ]

## remove samples containing missing data
ind <- rowSums(is.na(X)) > 0
ind2 <- rowSums(is.na(X_2)) > 0

y <- y[!(ind | ind2)]
X <- X[!(ind | ind2), ]
X_2 <- X_2[!(ind | ind2), ]

N <- length(y)

## fit fgam using FA measurements along corpus callosum
## as functional predictor with PASAT as response
## using 8 cubic B-splines for marginal bases with third
## order marginal difference penalties
## specifying gamma > 1 enforces more smoothing when using
## GCV to choose smoothing parameters
fit <- fgam(y ~ af(X, splinepars = list(k = c(8, 8), m = list(c(2, 3), c(2, 3)))), gamma = 1.2)
vis.fgam(fit)


## fgam term for the cca measurements plus an flm term for the rcst measurements
## leave out 10 samples for prediction
test <- sample(N, 10)
fit <- fgam(y ~ af(X, splinepars = list(k = c(7, 7), m = list(c(2, 2), c(2, 2)))) +
  lf(X_2, splinepars = list(k=7, m = c(2, 2))), subset=(1:N)[-test])
## plot the fits
plot(fit)
## vis.fgam(fit, af.term = "X")
vis.fgam(fit, af.term="X", xval=.6)
## predict the ten left outs samples
pred <- predict(fit, newdata = list(X=X[test, ], X_2 = X_2[test, ]), type='response',
                PredOutOfRange = TRUE)
sqrt(mean((y[test] - pred)^2))
## Try to predict the binary response disease status (case or control)
##   using the quantile transformed measurements from the rcst tract
##   with a smooth component for a scalar covariate that is pure noise
y <- DTI$case[DTI$visit==1]
X <- DTI$cca[DTI$visit==1, ]
X_2 <- DTI$rcst[DTI$visit==1, ]

ind <- rowSums(is.na(X)) > 0
ind2 <- rowSums(is.na(X_2)) > 0

y <- y[!(ind | ind2)]
X <- X[!(ind | ind2), ]
X_2 <- X_2[!(ind | ind2), ]
z1 <- rnorm(length(y))

## select=TRUE allows terms to be zeroed out of model completely
fit <- fgam(y ~ s(z1, k = 10) + af(X_2, splinepars = list(k=c(7,7), m = list(c(2, 1), c(2, 1))),
            Qtransform=TRUE), family=binomial(), select=TRUE)
plot(fit)
vis.fgam(fit,af.term='X_2',plot.type='contour')



