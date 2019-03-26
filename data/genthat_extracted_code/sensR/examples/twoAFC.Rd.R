library(sensR)


### Name: twoAFC
### Title: Create 2-AFC binomial family
### Aliases: twoAFC
### Keywords: models

### ** Examples

## Estimating d-prime using glm for a 2-AFC test:
xt <- matrix(c(10, 5), ncol = 2) ## data: 10 correct answers, 5 incorrect
res <- glm(xt ~ 1, family = twoAFC)
summary(res)
## Equivalent to (Estimate and Std. Error):
discrim(10, 15, method="twoAFC")

## Don't show: 
## Test agreement of glm and discrim results:
x <- coef(summary(res))[, 1:2]
y <- coef(discrim(10, 15, method="twoAFC"))["d-prime", 1:2]
stopifnot(
  isTRUE(all.equal(as.vector(x), as.vector(y))),
  isTRUE(all.equal(res$deviance, 0))
)
## End(Don't show)
## Extended example plotting the profile likelihood
## data: 10 correct and 8 incorrect:
xt <- matrix(c(10, 8), ncol = 2)
summary(res <- glm(xt ~ 1, family = twoAFC))
N <- 100
dev <- double(N)
level <- c(0.95, 0.99)
delta <- seq(1e-4, 3, length = N)
for(i in 1:N)
  dev[i] <- glm(xt ~ -1 + offset(delta[i]),
                family = twoAFC)$deviance
plot(delta, exp(-dev/2), type = "l",
     xlab = expression(delta),
     ylab = "Normalized Profile Likelihood")
## Add Normal approximation:
lines(delta, exp(-(delta - coef(res))^2 /
                 (2 * vcov(res))), lty = 2)
## Add confidence limits:
lim <- sapply(level, function(x)
              exp(-qchisq(x, df=1)/2) )
abline(h = lim, col = "grey")




