library(Countr)


### Name: evCount_conv_bi
### Title: Expected value and variance of renewal count process
### Aliases: evCount_conv_bi evCount_conv_user

### ** Examples

pwei_user <- function(tt, distP) {
    alpha <- exp(-log(distP[["scale"]]) / distP[["shape"]])
    pweibull(q = tt, scale = alpha, shape = distP[["shape"]],
             lower.tail = FALSE)
}

## ev convolution Poisson count
lambda <- 2.56
beta <- 1
distPars <- list(scale = lambda, shape = beta)

evbi <- evCount_conv_bi(20, distPars, dist = "weibull")
evu <- evCount_conv_user(20, distPars, c(2, 2), pwei_user, "dePril")

c(evbi[["ExpectedValue"]], lambda)
c(evu[["ExpectedValue"]], lambda )
c(evbi[["Variance"]], lambda     )
c(evu[["Variance"]], lambda      )

## ev convolution weibull count
lambda <- 2.56
beta <- 1.35
distPars <- list(scale = lambda, shape = beta)

evbi <- evCount_conv_bi(20, distPars, dist = "weibull")
evu <- evCount_conv_user(20, distPars, c(2.35, 2), pwei_user, "dePril")

x <- 1:20
px <- dCount_conv_bi(x, distPars, "weibull", "dePril",
                     nsteps = 100)
ev <- sum(x * px)
var <- sum(x^2 * px) - ev^2

c(evbi[["ExpectedValue"]], ev)
c(evu[["ExpectedValue"]], ev )
c(evbi[["Variance"]], var    )
c(evu[["Variance"]], var     )



