## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(emhawkes)

## ------------------------------------------------------------------------
set.seed(1107)
mu1 <- 0.3; alpha1 <- 1.2; beta1 <- 1.5
hspec1 <- new("hspec", mu=mu1, alpha=alpha1, beta=beta1)
show(hspec1)

## ---- warning=FALSE------------------------------------------------------
res1 <- hsim(hspec1, size=100)
summary(res1)

## ---- warning=FALSE------------------------------------------------------
logLik(hspec1, inter_arrival = res1$inter_arrival)

## ---- warning=FALSE------------------------------------------------------
mu0 <- 0.5; alpha0 <- 1.0; beta0 <- 1.8
hspec0 <- new("hspec", mu=mu0, alpha=alpha0, beta=beta0)
mle <- hfit(hspec0, inter_arrival = res1$inter_arrival)
summary(mle)

## ------------------------------------------------------------------------
mu2 <- matrix(c(0.2), nrow = 2)
alpha2 <- matrix(c(0.5, 0.9, 0.9, 0.5), nrow = 2, byrow = TRUE)
beta2 <- matrix(c(2.25, 2.25, 2.25, 2.25), nrow = 2, byrow = TRUE)
lambda0 <- matrix(c(0.1, 0.1, 0.1, 0.1), nrow = 2, byrow = TRUE)
hspec2 <- new("hspec", mu=mu2, alpha=alpha2, beta=beta2)
print(hspec2)

## ------------------------------------------------------------------------
res2 <- hsim(hspec2,  size=1000)
summary(res2)

## ------------------------------------------------------------------------
inter_arrival2 <- res2$inter_arrival
type2 <- res2$type

## ------------------------------------------------------------------------
logLik(hspec2, inter_arrival = inter_arrival2, type = type2)

## ---- warning=FALSE------------------------------------------------------
hspec0 <- hspec2
mle <- hfit(hspec0, inter_arrival = inter_arrival2, type = type2)
summary(mle)

## ------------------------------------------------------------------------
print(hspec2)

## ---- warning=FALSE------------------------------------------------------
res2 <- hsim(hspec2,  size=1000)

## ---- warning=FALSE------------------------------------------------------
mu0 <- matrix(c(0.15, 0.15), nrow = 2)
alpha0 <- matrix(c(0.75, 0.75, 0.75, 0.75), nrow = 2, byrow=TRUE)
beta0 <- matrix(c(2.6, 2.6, 2.6, 2.6), nrow = 2, byrow=TRUE)

hspec0 <- new("hspec", mu=mu0, alpha=alpha0, beta=beta0)
summary(hfit(hspec0, inter_arrival = res2$inter_arrival, type = res2$type))

## ---- warning=FALSE------------------------------------------------------
mu0 <- matrix(c(0.15, 0.15), nrow = 2)
alpha0 <- matrix(c(0.75, 0.751, 0.751, 0.75), nrow = 2, byrow=TRUE)
beta0 <- matrix(c(2.6, 2.6, 2.6, 2.6), nrow = 2, byrow=TRUE)

hspec0 <- new("hspec", mu=mu0, alpha=alpha0, beta=beta0)
summary(hfit(hspec0, inter_arrival = res2$inter_arrival, type = res2$type))

## ---- warning=FALSE------------------------------------------------------
summary(hfit(hspec2, inter_arrival = res2$inter_arrival, type = res2$type, reduced=FALSE))

## ---- warning=FALSE------------------------------------------------------
mu <- matrix(c(0.15, 0.15), nrow=2)
alpha <- matrix(c(0.75, 0.6, 0.6, 0.75), nrow=2, byrow=T)
beta <- matrix(c(2.6, 2.6, 2.6, 2.6), nrow=2)
rmark <- function(param = c(p=0.65), ...){
  rgeom(1, p=param[1]) + 1
}

impact <- function(param = c(eta1=0.2), alpha, n, mark, ...){
  ma <- matrix(rep(mark[n]-1, 4), nrow = 2)
  alpha * ma * matrix( rep(param["eta1"], 4), nrow=2)
  #alpha * ma * matrix( c(rep(param["eta1"], 2), rep(param["eta2"], 2)), nrow=2)
}
h1 <- new("hspec", mu=mu, alpha=alpha, beta=beta,
          rmark = rmark,
          impact=impact)
res <- hsim(h1, size=1000, lambda0 = matrix(rep(0.1,4), nrow=2))

fit <- hfit(h1, 
            inter_arrival = res$inter_arrival,
            type = res$type,
            mark = res$mark,
            lambda0 = matrix(rep(0.1,4), nrow=2))

summary(fit)

## ---- warning=FALSE------------------------------------------------------
mu <- matrix(c(0.02, 0.02, 0.04, 0.04), nrow = 4)


alpha <- function(param = c(alpha11 = 0, alpha12 = 0.3, alpha33 = 0.3, alpha34 = 0.4)){
  matrix(c(param["alpha11"], param["alpha12"], 0, 0,
           param["alpha12"], param["alpha11"], 0, 0,
           0, 0, param["alpha33"], param["alpha34"],
           0, 0, param["alpha34"], param["alpha33"]), nrow = 4, byrow = T)
}


beta <- matrix(c(rep(0.7, 8), rep(1.1, 8)), nrow = 4, byrow = T)

impact <- function(param = c(alpha1n=0, alpha1w=0.1, alpha2n=0.1, alpha2w=0.2),
                   n=n, N=N, ...){
  
  Psi <- matrix(c(0, 0, param['alpha1w'], param['alpha1n'],
                  0, 0, param['alpha1n'], param['alpha1w'],
                  param['alpha2w'], param['alpha2n'], 0, 0,
                  param['alpha2n'], param['alpha2w'], 0, 0), nrow=4, byrow=T)
  
  ind <- N[,"N1"][n] - N[,"N2"][n] > N[,"N3"][n] - N[,"N4"][n] + 0.5
  
  km <- matrix(c(!ind, !ind, !ind, !ind,
                 ind, ind, ind, ind,
                 ind, ind, ind, ind,
                 !ind, !ind, !ind, !ind), nrow = 4, byrow = T)
  
  km * Psi
}

h <- new("hspec",
         mu = mu, alpha = alpha, beta = beta, impact = impact)

hr <- hsim(h, size=1000)


fit <- hfit(h, hr$inter_arrival, hr$type)
summary(fit)

