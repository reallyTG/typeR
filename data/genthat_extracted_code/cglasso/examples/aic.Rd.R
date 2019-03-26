library(cglasso)


### Name: aic
### Title: Akaike's An Information Criterion
### Aliases: aic bic print.gof plot.gof
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
out_aic <- aic(out)
out_aic
plot(out_aic)

out_bic <- bic(out)
out_bic
plot(out_bic)

##############
# cggm model #
##############
out_mle <- mle(out)
out_aic <- aic(out_mle)
out_aic
plot(out_aic)

out_bic <- bic(out_mle)
out_bic
plot(out_bic)

#################
# mglasso model #
#################
X <- rnorm(n * p)
na.id <- sample(n * p, size = n * p * 0.05, replace = TRUE)
X[na.id] <- NA
dim(X) <- c(n, p)
out <- mglasso(X)
out_aic <- aic(out)
out_aic
plot(out_aic)

out_bic <- bic(out)
out_bic
plot(out_bic)

##############
# mggm model #
##############
out_mle <- mle(out)
out_aic <- aic(out_mle)
out_aic
plot(out_aic)

out_bic <- bic(out_mle)
out_bic
plot(out_bic)

#################
# glasso model #
#################
X <- matrix(rnorm(n * p), nrow = n, ncol = p)
out <- glasso(X)
out_aic <- aic(out)
out_aic
plot(out_aic)

out_bic <- bic(out)
out_bic
plot(out_bic)

#############
# ggm model #
#############
out_mle <- mle(out)
out_aic <- aic(out_mle)
out_aic
plot(out_aic)

out_bic <- bic(out_mle)
out_bic
plot(out_bic)



