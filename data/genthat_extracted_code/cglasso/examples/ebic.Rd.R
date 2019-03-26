library(cglasso)


### Name: ebic
### Title: Extended Bayesian Information Criterion
### Aliases: ebic ebic.glasso ebic.mglasso ebic.cglasso
### Keywords: models

### ** Examples

library("cglasso")
set.seed(123)

#################
# cglasso model #
#################
n <- 100L
p <- 5L
mu <- rep.int(0L, times = p)
X <- rdatacggm(n = n, mu = mu, probr = 0.05)
out <- cglasso(X = X)
out_ebic <- ebic(out)
out_ebic
plot(out_ebic)

##############
# cggm model #
##############
out_mle <- mle(out)
out_ebic <- ebic(out_mle)
out_ebic
plot(out_ebic)

#################
# mglasso model #
#################
X <- rnorm(n * p)
id.na <- sample.int(n = n * p, size = n * p * 0.05)
X[id.na] <- NA
dim(X) <- c(n, p)
out <- mglasso(X = X)
out_ebic <- ebic(out)
out_ebic
plot(out_ebic)

##############
# mggm model #
##############
out_mle <- mle(out)
out_ebic <- ebic(out_mle)
out_ebic
plot(out_ebic)

#################
# glasso model #
#################
X <- rnorm(n * p)
dim(X) <- c(n, p)
out <- glasso(X)
out_ebic <- ebic(out)
out_ebic
plot(out_ebic)

#############
# ggm model #
#############
out_mle <- mle(out)
out_ebic <- ebic(out_mle)
out_ebic
plot(out_ebic)



