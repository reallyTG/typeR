## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  tidy = TRUE,
  collapse = TRUE, 
  comment = "#>"
  )

## ---- tidy=TRUE----------------------------------------------------------
# parameter vector
betas <-  c(1, 3, 2, 1.25, 3.25, 1.75, 0.75, 2.75, 2.25, 0, 0, 0)
# sample size
N <- 500 
# number of nominal response categories
ncategories <- 4  
# cluster size
clsize <- 3 
set.seed(1) 
# time-stationary covariate x_{i1}
x1 <- rep(rnorm(N), each = clsize)
# time-varying covariate x_{it2}
x2 <- rnorm(N * clsize) 
# create covariates dataframe 
xdata <- data.frame(x1, x2) 
set.seed(321)
library(SimCorMultRes)
# correlation matrix for the NORTA method
cor.matrix <- kronecker(toeplitz(c(1,rep(0.95,clsize-1))),diag(ncategories)) 
# simulation of clustered nominal responses
CorNorRes <- rmult.bcl(clsize = clsize, ncategories = ncategories, betas = betas, xformula = ~x1 + x2, xdata = xdata, cor.matrix = cor.matrix)
suppressPackageStartupMessages(library("multgee"))
# fitting a GEE model
fit <- nomLORgee(y~x1+x2,data=CorNorRes$simdata,id=id,repeated=time,LORstr="time.exch")
# checking regression coefficients
round(coef(fit),2)

## ------------------------------------------------------------------------
set.seed(12345)
# sample size
N <- 500
# cluster size
clsize <- 4
# category-specific intercepts
intercepts <- c(-1.5, -0.5, 0.5, 1.5)
# time-varying regression parameters associated with covariates
betas <- matrix(c(1, 2, 3, 4), 4, 1)
# time-stationary covariate 
x <- rep(rnorm(N), each = clsize)
# correlation matrix for the NORTA method
cor.matrix <- toeplitz(c(1, 0.85, 0.5, 0.15))
# simulation of ordinal responses
CorOrdRes <- rmult.clm(clsize = clsize, intercepts = intercepts, betas = betas, 
    xformula = ~x, cor.matrix = cor.matrix, link = "probit")
# first eight rows of the simulated dataframe
head(CorOrdRes$simdata, n = 8)

## ------------------------------------------------------------------------
set.seed(1)
# sample size
N <- 500
# cluster size
clsize <- 4
# category-specific intercepts
intercepts <- c(-1.5, -0.5, 0.5, 1.5)
# regression parameters associated with covariates
betas <- 1
# time-varying covariate
x <- rnorm(N * clsize)
# number of ordinal response categories
ncategories <- 5
# correlation matrix for the NORTA method
cor.matrix <- diag(1, (ncategories - 1) * clsize) + kronecker(toeplitz(c(0, 
    rep(0.24, ncategories - 2))), matrix(1, clsize, clsize))
# simulation of ordinal responses
CorOrdRes <- rmult.crm(clsize = clsize, intercepts = intercepts, betas = betas, 
    xformula = ~x, cor.matrix = cor.matrix, link = "probit")
# first six clusters with ordinal responses
head(CorOrdRes$Ysim)

## ------------------------------------------------------------------------
set.seed(123)
# sample size
N <- 100
# cluster size
clsize <- 4
# intercept
intercepts <- 0
# regression parameter associated with the covariate
betas <- 0.2
# correlation matrix for the NORTA method
cor.matrix <- toeplitz(c(1, 0.9, 0.9, 0.9))
# time-stationary covariate
x <- rep(rnorm(N), each = clsize)
# simulation of clustered binary responses
CorBinRes <- rbin(clsize = clsize, intercepts = intercepts, betas = betas, 
    xformula = ~x, cor.matrix = cor.matrix, link = "probit")
library(gee)
# fitting a GEE model
binGEEmod <- gee(y ~ x, family = binomial("probit"), id = id, data = CorBinRes$simdata)
# checking the estimated coefficients
summary(binGEEmod)$coefficients

## ------------------------------------------------------------------------
set.seed(8)
# simulation of epsilon variables
library(evd)
rlatent1 <- rmvevd(N, dep = sqrt(1 - 0.9), model = "log", d = clsize)
rlatent2 <- rmvevd(N, dep = sqrt(1 - 0.9), model = "log", d = clsize)
rlatent <- rlatent1 - rlatent2
# simulation of clustered binary responses
CorBinRes <- rbin(clsize = clsize, intercepts = intercepts, betas = betas, 
    xformula = ~x, rlatent = rlatent)
# fitting a GEE model
binGEEmod <- gee(y ~ x, family = binomial("logit"), id = id, data = CorBinRes$simdata)
# checking the estimated coefficients
summary(binGEEmod)$coefficients

## ------------------------------------------------------------------------
set.seed(123)
# sample size
N <- 5000
# cluster size
clsize <- 4
# intercept
intercepts <- qnorm(0.8)
# pseudo-covariate
x <- rep(0, each = clsize * N)
# regression parameter associated with the covariate
betas <- 0
# correlation matrix for the NORTA method
cor.matrix <- diag(clsize)
# simulation of clustered binary responses
CorBinRes <- rbin(clsize = clsize, intercepts = intercepts, betas = betas, 
    xformula = ~x, cor.matrix = cor.matrix, link = "probit")
library(gee)
# simulated marginal probabilities
colMeans(CorBinRes$Ysim)

## ---- tidy=TRUE----------------------------------------------------------
# sample size
N <- 5000
# cluster size
clsize <- 3 
# pseudo-covariate 
x <- rep(0, each = clsize * N)
# parameter vector
betas <-  c(log(0.1/0.4), 0, log(0.2/0.4), 0, log(0.3/0.4), 0, 0, 0)
# number of nominal response categories
ncategories <- 4  
set.seed(1) 
# correlation matrix for the NORTA method
cor.matrix <- kronecker(toeplitz(c(1,rep(0,clsize-1))),diag(ncategories)) 
# simulation of clustered nominal responses
CorNorRes <- rmult.bcl(clsize = clsize, ncategories = ncategories, betas = betas, xformula = ~x, cor.matrix = cor.matrix)
# simulated marginal probabilities
apply(CorNorRes$Ysim,2,table)/N

## ---- comment=""---------------------------------------------------------
citation("SimCorMultRes")

