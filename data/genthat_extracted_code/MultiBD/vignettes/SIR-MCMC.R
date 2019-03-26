## ------------------------------------------------------------------------
library(MultiBD)

## ------------------------------------------------------------------------
data(Eyam)
Eyam

## ------------------------------------------------------------------------
loglik_sir <- function(param, data) {
  alpha <- exp(param[1]) # Rates must be non-negative
  beta  <- exp(param[2])
  
  # Set-up SIR model
  drates1 <- function(a, b) { 0 }
  brates2 <- function(a, b) { 0 }
  drates2 <- function(a, b) { alpha * b     }
  trans12 <- function(a, b) { beta  * a * b }
  
  sum(sapply(1:(nrow(data) - 1), # Sum across all time steps k
             function(k) {
               log(
                 dbd_prob(  # Compute the transition probability matrix
                   t  = data$time[k + 1] - data$time[k], # Time increment
                   a0 = data$S[k], b0 = data$I[k],       # From: S(t_k), I(t_k)                                      
                   drates1, brates2, drates2, trans12,
                   a = data$S[k + 1], B = data$S[k] + data$I[k] - data$S[k + 1],
                   computeMode = 4, nblocks = 80         # Compute using 4 threads
                 )[1, data$I[k + 1] + 1]                 # To: S(t_(k+1)), I(t_(k+1))
               )
             }))
}

## ------------------------------------------------------------------------
logprior <- function(param) {
  log_alpha <- param[1]
  log_beta <- param[2]
  
  dnorm(log_alpha, mean = 0, sd = 100, log = TRUE) +
    dnorm(log_beta, mean = 0, sd = 100, log = TRUE)
}

## ----loadStuff, message=FALSE, warning=FALSE, echo=TRUE, eval=FALSE------
#  source("http://bioconductor.org/biocLite.R")
#  biocLite("graph")
#  biocLite("Rgraphviz")
#  install.packages("MCMCpack", repos = 'http://cran.us.r-project.org')
#  library(MCMCpack)

## ----doLoadStuff, echo=FALSE, eval=TRUE, include=FALSE-------------------
# Provide manual caching because knitr's caching
# is not working in my hands
file <- system.file("vignetteCache", "post_sample.RData", package="MultiBD")
if (!file.exists(file)) {
source("http://bioconductor.org/biocLite.R")
biocLite("graph")
biocLite("Rgraphviz")
install.packages("MCMCpack", repos = 'http://cran.us.r-project.org')
library(MCMCpack)
} 

## ------------------------------------------------------------------------
alpha0 <- 3.39
beta0  <- 0.0212

## ----longMCMCRun, eval=FALSE---------------------------------------------
#  post_sample <- MCMCmetrop1R(fun = function(param) { loglik_sir(param, Eyam) + logprior(param) },
#                             theta.init = log(c(alpha0, beta0)),
#                             mcmc = 1000, burnin = 200)

## ----runLongMCMCRun, echo=FALSE, eval=TRUE-------------------------------
# Provide manual caching because knitr's caching 
# is not working in my hands
if (file.exists(file)) {
  load(file)
} else {
post_sample <- MCMCmetrop1R(fun = function(param) { loglik_sir(param, Eyam) + logprior(param) },
                           theta.init = log(c(alpha0, beta0)),
                           mcmc = 1000, burnin = 200)
    # dir.create("cache", showWarnings = FALSE)
    save(post_sample, file = "../inst/vignetteCache/post_sample.RData")
}

## ------------------------------------------------------------------------
plot(as.vector(post_sample[,1]), type = "l", xlab = "Iteration", ylab = expression(log(alpha)))
plot(as.vector(post_sample[,2]), type = "l", xlab = "Iteration", ylab = expression(log(beta)))

## ----plot, warning=FALSE-------------------------------------------------
library(ggplot2)
x = as.vector(post_sample[,1])
y = as.vector(post_sample[,2])
df <- data.frame(x, y)
ggplot(df,aes(x = x,y = y)) +
  stat_density2d(aes(fill = ..level..), geom = "polygon", h = 0.26) + 
  scale_fill_gradient(low = "grey85", high = "grey35", guide = FALSE) +
  xlab(expression(log(alpha))) +
  ylab(expression(log(beta)))

## ------------------------------------------------------------------------
quantile(exp(post_sample[,1]), probs = c(0.025,0.975))
quantile(exp(post_sample[,2]), probs = c(0.025,0.975))

