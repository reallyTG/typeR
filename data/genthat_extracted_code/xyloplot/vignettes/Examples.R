## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(dev="svg", fig.width=7, fig.height=5)
library(xyloplot)
set.seed(1)

## ------------------------------------------------------------------------
xyloplot(rnorm(1000))

## ------------------------------------------------------------------------
xyloplot(
 x=lapply(1:3, function(mean) rnorm(mean=mean, n=1000)), 
 breaks=20,
 col=rainbow(3), 
 main="title")

## ------------------------------------------------------------------------
xyloplot(
 replicate(n=5, simplify=FALSE, 
  expr=factor(sample(c(0.01, 0.1, 0.2, 0.25, 0.5, 1), size=10, replace=TRUE))), 
 col=rainbow(5))

## ------------------------------------------------------------------------
xyloplot(
 sample(c("goldfish","cat","dog","fish","mouse","giraffe"), 
 size=100, replace=TRUE))

## ------------------------------------------------------------------------
data <- lapply(1:3, function(mean) rnorm(mean=mean, n=1000))
xyloplot(x=data)
n <- length(data)
positions <- xylo_positions(n)
upper_qs <- sapply(data, function(sample) quantile(sample, prob=0.75))
segments(x0=positions-1/n/2, x1=positions+1/n/2, y0=upper_qs, y1=upper_qs, col="red", pch=19)

## ------------------------------------------------------------------------
data_rhs <- lapply(2:4, function(mean) rnorm(mean=mean, sd=2, n=2000))
xyloplot(x=data, rhs=data_rhs, col=rainbow(2))

## ------------------------------------------------------------------------
lhs <- rnorm(n=1000)
rhs <- rnorm(n=2000)
par(mfrow=c(1, 2))
xyloplot(main="freq=FALSE", x=lhs, rhs=rhs, col=rainbow(2), freq=FALSE)
xyloplot(main="freq=TRUE", x=lhs, rhs=rhs, col=rainbow(2), freq=TRUE)

