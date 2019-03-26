library(sensR)


### Name: AnotA
### Title: Analysis of A-not-A tests
### Aliases: AnotA confint.anota plot.anota
### Keywords: models

### ** Examples

# data: 10 of the A-samples were judged to be A
#       20 A-samples in total
#       3 of the not-A samples were judged to be A
#       20 not-A-samples in total

AnotA(10, 20, 3, 20)
(m1 <- AnotA(10, 20, 3, 20))

## plot distributions of sensory intensity:
plot(m1)

## likelihood based confidence intervals:
confint(m1)

## Don't show: 
  ## Testing
  x <- as.vector(c(coef(m1), m1$se, m1$p.value))
  ## y := dput(x)
  y <- c(1.03643338948988, 0.442500608613267, 0.0203711975124656)
  ## z := dput(as.vector(confint(m1)))
  z <- c(-0.550522667455557, 0.190017579324113, 0.550522667455557,
    1.93313337684111)
  stopifnot(
    isTRUE(all.equal(x, y)),
    isTRUE(all.equal(as.vector(confint(m1)), z))
  )
## End(Don't show)
## Extended example plotting the profile likelihood
xt <- cbind(c(3, 10), c(20 - 3, 20 - 10))
lev <- gl(2, 1)
summary(res <- glm(xt ~ lev,
                   family = binomial(link = probit)))
N <- 100
dev <- double(N)
level <- c(0.95, 0.99)
delta <- seq(1e-4, 5, length = N)
for(i in 1:N)
  dev[i] <- glm(xt ~ 1 + offset(c(0, delta[i])),
                family = binomial(probit))$deviance
plot(delta, exp(-dev/2), type = "l",
     xlab = expression(delta),
     ylab = "Normalized Profile Likelihood")
## Add Normal approximation:
lines(delta, exp(-(delta - coef(res)[2])^2 /
                 (2 * vcov(res)[2,2])), lty = 2)
## Add confidence limits:
lim <- sapply(level, function(x)
              exp(-qchisq(x, df=1)/2) )
abline(h = lim, col = "grey")




