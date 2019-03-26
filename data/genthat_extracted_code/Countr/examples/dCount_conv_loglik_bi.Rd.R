library(Countr)


### Name: dCount_conv_loglik_bi
### Title: Log-likelihood of a count probability computed by convolution
###   (bi)
### Aliases: dCount_conv_loglik_bi dCount_conv_loglik_user

### ** Examples

x <- 0:10
lambda <- 2.56
distPars <- list(scale = lambda, shape = 1)
distParsList <- lapply(seq(along = x), function(ind) distPars)
extrapolParsList <- lapply(seq(along = x), function(ind) c(2, 1))
## user pwei
pwei_user <- function(tt, distP) {
    alpha <- exp(-log(distP[["scale"]]) / distP[["shape"]])
    pweibull(q = tt, scale = alpha, shape = distP[["shape"]],
             lower.tail = FALSE)
}

## log-likehood allProbs Poisson
dCount_conv_loglik_bi(x, distParsList,
                      "weibull", "direct", nsteps = 400)

dCount_conv_loglik_user(x, distParsList, extrapolParsList,
                        pwei_user, "direct", nsteps = 400)

## log-likehood naive Poisson
dCount_conv_loglik_bi(x, distParsList,
                      "weibull", "naive", nsteps = 400)

dCount_conv_loglik_user(x, distParsList, extrapolParsList,
                        pwei_user, "naive", nsteps = 400)

## log-likehood dePril Poisson
dCount_conv_loglik_bi(x, distParsList,
                      "weibull", "dePril", nsteps = 400)

dCount_conv_loglik_user(x, distParsList, extrapolParsList,
                        pwei_user, "dePril", nsteps = 400)
## see dCount_conv_loglik_bi()



