library(VGAM)


### Name: ordpoisson
### Title: Ordinal Poisson Family Function
### Aliases: ordpoisson
### Keywords: math models regression

### ** Examples

set.seed(123)  # Example 1
x2 <- runif(n <- 1000); x3 <- runif(n)
mymu <- exp(3 - 1 * x2 + 2 * x3)
y1 <- rpois(n, lambda = mymu)
cutpts <- c(-Inf, 20, 30, Inf)
fcutpts <- cutpts[is.finite(cutpts)]  # finite cutpoints
ystar <- cut(y1, breaks = cutpts, labels = FALSE)
## Not run: 
##D plot(x2, x3, col = ystar, pch = as.character(ystar))
## End(Not run)
table(ystar) / sum(table(ystar))
fit <- vglm(ystar ~ x2 + x3, fam = ordpoisson(cutpoi = fcutpts))
head(depvar(fit))  # This can be input if countdata = TRUE
head(fitted(fit))
head(predict(fit))
coef(fit, matrix = TRUE)
fit@extra

# Example 2: multivariate and there are no obsns between some cutpoints
cutpts2 <- c(-Inf, 0, 9, 10, 20, 70, 200, 201, Inf)
fcutpts2 <- cutpts2[is.finite(cutpts2)]  # finite cutpoints
y2 <- rpois(n, lambda = mymu)   # Same model as y1
ystar2 <- cut(y2, breaks = cutpts2, labels = FALSE)
table(ystar2) / sum(table(ystar2))
fit <- vglm(cbind(ystar,ystar2) ~ x2 + x3, fam =
            ordpoisson(cutpoi = c(fcutpts,Inf,fcutpts2,Inf),
                       Levels = c(length(fcutpts)+1,length(fcutpts2)+1),
                       parallel = TRUE), trace = TRUE)
coef(fit, matrix = TRUE)
fit@extra
constraints(fit)
summary(depvar(fit))  # Some columns have all zeros



