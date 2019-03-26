## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----simulatedata--------------------------------------------------------
# Number of observations
n <- 1000
# Coefficient for a path (x -> m)
a <- .75
# Coefficient for b path (m -> y)
b <- .80
# Coefficient for total effect (x -> y)
c <- .60
# Coefficient for indirect effect (x -> m -> y)
ab <- a * b
# Coefficient for direct effect (x -> y)
cd <- c - ab
# Compute x, m, y values
set.seed(100)
x <- rnorm(n)
m <- a * x + sqrt(1 - a^2) * rnorm(n)
eps <- 1 - (cd^2 + b^2 + 2*a * cd * b)
y <- cd * x + b * m + eps * rnorm(n)

data <- data.frame(y = y,
                   x = x,
                   m = m)

## ----lavaan1-------------------------------------------------------------
model <- "
# direct effect
y ~ c*x
# mediator
m ~ a*x
y ~ b*m
# indirect effect (a*b)
ab := a*b
# total effect
cd := c + (a*b)"

fit <- lavaan::sem(model, data = data)
lavaan::summary(fit)

## ----fitdata1, eval = FALSE----------------------------------------------
#  bayesian.fit <- bfw::bfw(project.data = data,
#                      latent = "x,m,y",
#                      saved.steps = 50000,
#                      latent.names = "Independent,Mediator,Dependent",
#                      additional = "indirect <- xm * my , total <- xy + (xm * my)",
#                      additional.names = "AB,C",
#                      jags.model = "fit",
#                      silent = TRUE)
#  
#  round(bayesian.fit$summary.MCMC[,3:7],3)
#  #>                                       Mode   ESS  HDIlo HDIhi    n
#  #> beta[2,1]: Mediator vs. Independent  0.760 48988  0.720 0.799 1000
#  #> beta[3,1]: Dependent vs. Independent 0.024 13042 -0.012 0.058 1000
#  #> beta[3,2]: Dependent vs. Mediator    0.751 13230  0.715 0.786 1000
#  #> indirect[1]: AB                      0.571 21431  0.531 0.611 1000
#  #> total[1]: C                          0.591 49074  0.555 0.630 1000

## ----noise---------------------------------------------------------------
biased.sigma <-matrix(c(1,1,0,1,1,0,0,0,1),3,3)
set.seed(101)
noise <- MASS::mvrnorm(n=2,
                       mu=c(200, 300, 0),
                       Sigma=biased.sigma,
                       empirical=FALSE)
colnames(noise) <- c("y","x","m")
biased.data <- rbind(data,noise)

## ----lavaan2-------------------------------------------------------------
biased.fit <- lavaan::sem(model, data = biased.data)
lavaan::summary(biased.fit)

## ----fitdata2, eval = FALSE----------------------------------------------
#  biased.bfit <- bfw::bfw(project.data = data,
#                      latent = "x,m,y",
#                      saved.steps = 50000,
#                      latent.names = "Independent,Mediator,Dependent",
#                      additional = "indirect <- xm * my , total <- xy + (xm * my)",
#                      additional.names = "AB,C",
#                      jags.model = "fit",
#                      run.robust = TRUE,
#                      jags.seed = 101,
#                      silent = TRUE)
#  
#  round(biased.bfit$summary.MCMC[,3:7],3)
#  #>                                       Mode   ESS  HDIlo HDIhi    n
#  #> beta[2,1]: Mediator vs. Independent  0.763 31178  0.721 0.799 1000
#  #> beta[3,1]: Dependent vs. Independent 0.022  7724 -0.014 0.057 1000
#  #> beta[3,2]: Dependent vs. Mediator    0.751  7772  0.714 0.786 1000
#  #> indirect[1]: AB                      0.572 12913  0.531 0.610 1000
#  #> total[1]: C                          0.590 31362  0.557 0.631 1000

