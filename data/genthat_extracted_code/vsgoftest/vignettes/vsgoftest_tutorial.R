## ----echo = FALSE--------------------------------------------------------
knitr::opts_chunk$set(comment = '')

## ----eval = FALSE--------------------------------------------------------
#  install.packages('vsgoftest')

## ----echo = TRUE, eval = FALSE-------------------------------------------
#  #Package devtools must be installed
#  devtools::install_github('pregnault/vsgoftest')

## ------------------------------------------------------------------------
library('vsgoftest')
set.seed(2)	#set seed of PRNG
samp <- rnorm(n = 100, mean = 0, sd = 1) #sampling from normal distribution
entropy.estimate(x = samp, window = 8) #estimating entropy with window = 8
log(2*pi*exp(1))/2 #the exact value of entropy

## ------------------------------------------------------------------------
sapply(1:10, function(w) entropy.estimate(x = samp, window =w))

## ------------------------------------------------------------------------
n <- 100 #sample size
V <- sapply(1:(n/2 - 1), function(w) entropy.estimate(x = samp, window =w))
which.max(V) #Choose window that maximizes entropy

## ------------------------------------------------------------------------
set.seed(5)
n <- 100 #Sample size
samp <- rpareto(n, c = 1, mu = 2) #sampling from Pareto distribution
entropy.estimate(x = samp, window = 3)
-log(2) + 3/2 #Exact value of entropy

## ------------------------------------------------------------------------
set.seed(5)
samp <- rnorm(50,2,3)
vs.test(x = samp, densfun = 'dlaplace')

## ------------------------------------------------------------------------
set.seed(4)
vs.test(x = samp, densfun = 'dnorm')

## ------------------------------------------------------------------------
set.seed(26)
vs.test(x = samp, densfun = 'dnorm', param = c(2,3))

## ----echo = TRUE, eval = TRUE, error = TRUE------------------------------
set.seed(2)
samp <- rnorm(50, -2, 1)
vs.test(samp, densfun = 'dnorm', param = -2)

## ------------------------------------------------------------------------
set.seed(1)
samp <- rweibull(200, shape = 1.05, scale = 1)
vs.test(samp, densfun = 'dexp')

## ------------------------------------------------------------------------
set.seed(2)
vs.test(samp, densfun = 'dexp', simulate.p.value = TRUE, B = 10000)

## ------------------------------------------------------------------------
set.seed(63)
vs.test(samp, densfun = 'dexp', delta = 5/30)

## ------------------------------------------------------------------------
set.seed(8)
samp <- rexp(30, rate = 3)
vs.test(x = samp, densfun = "dlnorm")

## ------------------------------------------------------------------------
vs.test(x = samp, densfun = "dlnorm", extend = TRUE)

## ----echo = TRUE, eval = TRUE, error = TRUE------------------------------
samp <- c(samp, rep(4,3)) #add ties in the previous sample
vs.test(x = samp, densfun = "dexp")

## ------------------------------------------------------------------------
vs.test(x = samp, densfun = "dexp", extend = TRUE)

## ----echo = TRUE, eval = TRUE, error = TRUE------------------------------
set.seed(84)
ech <- rpareto(20, mu = 1/2, c = 1)
vs.test(x = ech, densfun = 'dpareto', param = c(1/2, 1))

## ------------------------------------------------------------------------
data(contaminants)
set.seed(1)
vs.test(x = aluminium2, densfun = 'dpareto')

## ----echo = FALSE--------------------------------------------------------
knitr::opts_chunk$set(warning = FALSE)

## ------------------------------------------------------------------------
set.seed(1)
vs.test(x = aluminium1, densfun = 'dlnorm')

## ------------------------------------------------------------------------
set.seed(1)
vs.test(x = aluminium2, densfun = 'dlnorm')

## ------------------------------------------------------------------------
set.seed(1)
vs.test(x = toluene, densfun = 'dlnorm', extend = TRUE, relax = TRUE)

## ------------------------------------------------------------------------
set.seed(1)
vs.test(x = log(toluene), densfun ='dnorm', extend = TRUE)

## ------------------------------------------------------------------------
set.seed(1)
vs.test(x = aluminium2, densfun = 'dpareto')

## ------------------------------------------------------------------------
#Compute the MLE of parameters of Pareto dist.
res.test <- vs.test(x = toluene,
                    densfun = 'dpareto',
                    extend = TRUE, relax = TRUE)
#Test uniformity of transformed data
set.seed(5)
vs.test(x = ppareto(toluene,
                    mu = res.test$estimate[1],
                    c = res.test$estimate[2]),
        densfun ='dunif', param = c(0,1), extend = TRUE)

