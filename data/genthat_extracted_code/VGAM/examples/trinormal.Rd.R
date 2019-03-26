library(VGAM)


### Name: trinormal
### Title: Trivariate Normal Distribution Family Function
### Aliases: trinormal
### Keywords: models regression

### ** Examples

set.seed(123); nn <- 1000
tdata <- data.frame(x2 = runif(nn), x3 = runif(nn))
tdata <- transform(tdata, y1 = rnorm(nn, 1 + 2 * x2),
                          y2 = rnorm(nn, 3 + 4 * x2),
                          y3 = rnorm(nn, 4 + 5 * x2))
fit1 <- vglm(cbind(y1, y2, y3) ~ x2, data = tdata,
             trinormal(eq.sd = TRUE, eq.cor = TRUE), trace = TRUE)
coef(fit1, matrix = TRUE)
constraints(fit1)
summary(fit1)
## Not run: 
##D  # Try this when eq.sd = TRUE, eq.cor = TRUE:
##D fit2 <- vglm(cbind(y1, y2, y3) ~ x2, data = tdata, stepsize = 0.25,
##D              trinormal(eq.sd = TRUE, eq.cor = TRUE,
##D                        lrho12 = extlogit(min = -0.5),
##D                        lrho23 = extlogit(min = -0.5),
##D                        lrho13 = extlogit(min = -0.5)), trace = TRUE)
##D coef(fit2, matrix = TRUE)
## End(Not run)



