library(VGAM)


### Name: CommonVGAMffArguments
### Title: Common VGAM Family Function Arguments
### Aliases: CommonVGAMffArguments TypicalVGAMfamilyFunction
### Keywords: models

### ** Examples

# Example 1
cumulative()
cumulative(link = "probit", reverse = TRUE, parallel = TRUE)

# Example 2
wdata <- data.frame(x2 = runif(nn <- 1000))
wdata <- transform(wdata,
         y = rweibull(nn, shape = 2 + exp(1 + x2), scale = exp(-0.5)))
fit <- vglm(y ~ x2, weibullR(lshape = logoff(offset = -2), zero = 2), data = wdata)
coef(fit, mat = TRUE)

# Example 3; multivariate (multiple) response
## Not run: 
##D ndata <- data.frame(x = runif(nn <- 500))
##D ndata <- transform(ndata,
##D            y1 = rnbinom(nn, mu = exp(3+x), size = exp(1)),  # k is size
##D            y2 = rnbinom(nn, mu = exp(2-x), size = exp(0)))
##D fit <- vglm(cbind(y1, y2) ~ x, negbinomial(zero = -2), data = ndata)
##D coef(fit, matrix = TRUE)
## End(Not run)
# Example 4
## Not run: 
##D # fit1 and fit2 are equivalent
##D fit1 <- vglm(ymatrix ~ x2 + x3 + x4 + x5,
##D              cumulative(parallel = FALSE ~ 1 + x3 + x5), data = cdata)
##D fit2 <- vglm(ymatrix ~ x2 + x3 + x4 + x5,
##D              cumulative(parallel = TRUE ~ x2 + x4), data = cdata)
## End(Not run)

# Example 5
udata <- data.frame(x2 = rnorm(nn <- 200))
udata <- transform(udata,
           y1 = rnorm(nn, mean = 1 - 3*x2, sd = exp(1 + 0.2*x2)),
           y2 = rnorm(nn, mean = 1 - 3*x2, sd = exp(1)))
args(uninormal)
fit1 <- vglm(y1 ~ x2, uninormal, data = udata)            # This is okay
fit2 <- vglm(y2 ~ x2, uninormal(zero = 2), data = udata)  # This is okay

# This creates potential conflict
clist <- list("(Intercept)" = diag(2), "x2" = diag(2))
fit3 <- vglm(y2 ~ x2, uninormal(zero = 2), data = udata,
             constraints = clist)  # Conflict!
coef(fit3, matrix = TRUE)  # Shows that clist[["x2"]] was overwritten,
constraints(fit3)  # i.e., 'zero' seems to override the 'constraints' arg

# Example 6 ('whitespace' argument)
pneumo <- transform(pneumo, let = log(exposure.time))
fit1 <- vglm(cbind(normal, mild, severe) ~ let,
             sratio(whitespace = FALSE, parallel = TRUE), data = pneumo)
fit2 <- vglm(cbind(normal, mild, severe) ~ let,
             sratio(whitespace = TRUE,  parallel = TRUE), data = pneumo)
head(predict(fit1), 2)  # No white spaces
head(predict(fit2), 2)  # Uses white spaces

# Example 7 ('zero' argument with character input)
set.seed(123); n <- 1000
ldata <- data.frame(x2 = runif(n))
ldata <- transform(ldata, y1 = rlogis(n, loc = 0+5*x2, scale = exp(2)))
ldata <- transform(ldata, y2 = rlogis(n, loc = 0+5*x2, scale = exp(0+1*x2)))
ldata <- transform(ldata, w1 = runif(n))
ldata <- transform(ldata, w2 = runif(n))
fit7 <- vglm(cbind(y1, y2) ~ x2,
#            logistic(zero = "location1"),  # location1 is intercept-only
#            logistic(zero = "location2"),
#            logistic(zero = "location*"),  # Not okay... all is unmatched
#            logistic(zero = "scale1"),
#            logistic(zero = "scale2"),
#            logistic(zero = "scale"),  # Both scale parameters are matched
             logistic(zero = c("location", "scale2")),  # All but scale1
#            logistic(zero = c("LOCAT", "scale2")),  # Only scale2 is matched
#            logistic(zero = c("LOCAT")),  # Nothing is matched
#            trace = TRUE,
#            weights = cbind(w1, w2),
             weights = w1,
             data = ldata)
coef(fit7, matrix = TRUE)



