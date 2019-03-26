library(VGAM)


### Name: skewnormal
### Title: Univariate Skew-Normal Distribution Family Function
### Aliases: skewnormal
### Keywords: models regression

### ** Examples

sdata <- data.frame(y1 = rskewnorm(nn <- 1000, shape = 5))
fit1 <- vglm(y1 ~ 1, skewnormal, data = sdata, trace = TRUE)
coef(fit1, matrix = TRUE)
head(fitted(fit1), 1)
with(sdata, mean(y1))
## Not run: 
##D  with(sdata, hist(y1, prob = TRUE))
##D x <- with(sdata, seq(min(y1), max(y1), len = 200))
##D with(sdata, lines(x, dskewnorm(x, shape = Coef(fit1)), col = "blue")) 
## End(Not run)

sdata <- data.frame(x2 = runif(nn))
sdata <- transform(sdata, y2 = rskewnorm(nn, shape = 1 + 2*x2))
fit2 <- vglm(y2 ~ x2, skewnormal, data = sdata, trace = TRUE, crit = "coef")
summary(fit2)



