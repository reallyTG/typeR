## ---- fig.show='hold'----------------------------------------------------
library(plotrr)
a <- runif(400, min = 0, max = 1)
b <- a + rnorm(400, mean = 0, sd = 1)
c <- rep(c(1:4), times = 100)
data <- data.frame(a, b, c)
bivarplots("a", "b", "c", data)

## ---- fig.show='hold'----------------------------------------------------
library(plotrr)
a <- runif(400, min = 0, max = 1)
b <- a + rnorm(400, mean = 0, sd = 1)
c <- rep(c(1:4), times = 100)
data <- data.frame(a, b, c)
dotplots("a", "b", "c", data, 20)

## ---- fig.show='hold'----------------------------------------------------
library(plotrr)
a <- runif(400, min = 0, max = 1)
b <- a + rnorm(400, mean = 0, sd = 1)
c <- rep(c(1:4), times = 100)
data <- data.frame(a, b, c)
violinplots("a", "b", "c", data)

## ---- fig.show='hold'----------------------------------------------------
library(plotrr)
a <- rnorm(400, mean = 2, sd = 100)
b <- a + rnorm(400, mean = 0, sd = 1)
c <- rep(c(1:4), times = 100)
data <- data.frame(a, b, c)
histplots("a", "b", "c", data, 5)

## ---- fig.show='hold'----------------------------------------------------
library(plotrr)
a <- runif(1000, min = 0, max = 1)
b <- a + rnorm(1000, mean = 0, sd =1)
data <- data.frame(a, b)
bivarrugplot("a", "b", data)

