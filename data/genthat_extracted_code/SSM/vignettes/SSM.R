## ---- echo = FALSE, results = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = TRUE)
library(SSM)

## ------------------------------------------------------------------------
design <- seq(-1, 1, 0.25)
responses <- sapply(design, "^", 2)
s <- fit.ssm(design, responses)
s

## ------------------------------------------------------------------------
predict(s, 0.5)
plot(s)

## ---- fig.show='hold'----------------------------------------------------
# default behaviour
s   <- fit.ssm(design, responses); s
# too large to fit
s100 <- fit.ssm(design, responses, basis_size = 100); s100
# instabilty indicated by plot
s70 <- fit.ssm(design, responses, basis_size = 70); s70
plot(s70, main = "70 terms")

s50 <- fit.ssm(design, responses, basis_size = 50); s50
plot(s50, main = "50 terms")


## ------------------------------------------------------------------------
f <- function(x) sum(x * 1:3) + 5 * x[1]*x[2]
design <- matrix(runif(300, -1, 1), ncol = 3)
response <- apply(design, 1, f)
s <- fit.ssm(design, response, SA = TRUE)
s
sensitivity.plot(s, "main_sobol", cex.main = 0.5)
# The grey bars indicate interactions
sensitivity.plot(s, "sobol", cex.main = 0.5)
# This plots total indices for main effects, and total interaction indices for second order interactions
sensitivity.plot(s, "total", cex.main = 0.5)

## ------------------------------------------------------------------------
# A stupid example, but fit new model without main effect of first variable
s3 <- fit.ssm(design, response, SA = TRUE, exclude = list(1))
s3
sensitivity.plot(s3, "sobol", cex.main = 0.5)

## ------------------------------------------------------------------------
s <- fit.ssm(design, response, validation = TRUE)
s

## ---- fig.show = 'hold'--------------------------------------------------
design <- seq(-1, 1, 0.25)
responses <- sapply(design, "^", 2)
s1 <- fit.ssm(design, responses, GP = TRUE)
s2 <- fit.ssm(design, responses, GP = TRUE, type = "matern32")
plot(s1, sub = "Squared exponential")
plot(s2, sub = "Matern 3/2")

## ------------------------------------------------------------------------
# ten point design in two factors
X <- matrix(runif(20, -1, 1), ncol = 2)
Y <- apply(X, 1, sum)
# fit SSM
s <- fit.ssm(X, Y);s
# fit SSM with same structure to first nine design points only
s1 <- fit.ssm(X[1:9, ], Y[1:9], ssm = s);s1

