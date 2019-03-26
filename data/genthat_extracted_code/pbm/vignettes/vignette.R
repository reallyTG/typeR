## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- fig.show='hold',fig.height=3.5,fig.width=5,fig.cap = "Example of a 1:1 binding curve."----
library(pbm)
time <- seq(0,1000)
response <- binding1to1(time,500,6e-7,10000,0.01,0.8)
plot(time, response, type="l")

## ---- fig.show='hold',fig.height=3.5,fig.width=5,fig.cap = "Example of a 1:1 binding curve with baseline drift."----
library(pbm)
time <- seq(0,1000)
response <- binding1to1(time,500,6e-7,10000,0.01,0.8, drift = 1e-04)
plot(time, response, type="l")

## ---- fig.show='hold',fig.height=3.5,fig.width=5,fig.cap = "Example of a 2:1 binding curve."----
library(pbm)
time <- seq(0,1000)
response <- binding2to1(time,500,6e-7,10000,0.01,0.5,2500,0.001,0.3)
plot(time, response, type="l")

## ---- fig.show='hold',fig.height=3.5,fig.width=5,fig.cap = "Example of 2:1 heterogeneous model fit."----
library(pbm)

# Generate example binding data with noise
time <- seq(0,1000)
response <- binding2to1(time,500,6e-7,10000,0.01,0.5,2500,0.001,0.3)
noisyresponse <- jitter(response,amount=0.02)
data <- data.frame(time, noisyresponse)
names(data) <- c("x","y")

# Fit a nlm to binding data
startingvalues <- list(kon1=70000,koff1=0.01,rmax1=0.3,kon2=9000,koff2=0.004,rmax2=0.3)
fit <- nls(y ~ binding2to1(x,500,6e-7,kon1,koff1,rmax1,kon2,koff2,rmax2),
  data=data,
  start=startingvalues)

# Plot the fitted model
plot(data$x, data$y, type="p", pch=4, cex=.5)
par(col="red",lwd=3)
lines(data$x,predict(fit, list(x=data$x)))

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(t(coefficients(fit)))

