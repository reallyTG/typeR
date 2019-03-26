library(VGAM)


### Name: Links
### Title: Link functions for VGLM/VGAM/etc. families
### Aliases: Links TypicalVGAMlink
### Keywords: models

### ** Examples

logit("a")
logit("a", short = FALSE)
logit("a", short = FALSE, tag = TRUE)

logoff(1:5, offset = 1)  # Same as log(1:5 + 1)
powerlink(1:5, power = 2)  # Same as (1:5)^2

## Not run: 
##D  # This is old and no longer works:
##D logoff(1:5, earg = list(offset = 1))
##D powerlink(1:5, earg = list(power = 2))
## End(Not run)

fit1 <- vgam(agaaus ~ altitude, binomialff(link = "cloglog"), hunua)  # best
fit2 <- vgam(agaaus ~ altitude, binomialff(link =  cloglog ), hunua)  # okay

## Not run: 
##D # This no longer works since "clog" is not a valid VGAM link function:
##D fit3 <- vgam(agaaus ~ altitude, binomialff(link = "clog"), hunua)  # not okay
##D 
##D 
##D # No matter what the link, the estimated var-cov matrix is the same
##D y <- rbeta(n = 1000, shape1 = exp(0), shape2 = exp(1))
##D fit1 <- vglm(y ~ 1, betaR(lshape1 = "identitylink", lshape2 = "identitylink"),
##D              trace = TRUE, crit = "coef")
##D fit2 <- vglm(y ~ 1, betaR(lshape1 = logoff(offset = 1.1),
##D                           lshape2 = logoff(offset = 1.1)), trace = TRUE)
##D vcov(fit1, untransform = TRUE)
##D vcov(fit1, untransform = TRUE) - vcov(fit2, untransform = TRUE)  # Should be all 0s
##D \dontrun{ # This is old:
##D fit1@misc$earg  # Some 'special' parameters
##D fit2@misc$earg  # Some 'special' parameters are here
##D }
##D 
##D 
##D par(mfrow = c(2, 2))
##D p <- seq(0.05, 0.95, len = 200)  # A rather restricted range
##D x <- seq(-4, 4, len = 200)
##D plot(p, logit(p), type = "l", col = "blue")
##D plot(x, logit(x, inverse = TRUE), type = "l", col = "blue")
##D plot(p, logit(p, deriv = 1), type = "l", col = "blue")  # 1 / (p*(1-p))
##D plot(p, logit(p, deriv = 2), type = "l", col = "blue")  # (2*p-1)/(p*(1-p))^2
## End(Not run)



