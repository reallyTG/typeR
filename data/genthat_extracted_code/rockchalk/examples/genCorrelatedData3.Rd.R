library(rockchalk)


### Name: genCorrelatedData3
### Title: Generate correlated data for simulations (third edition)
### Aliases: genCorrelatedData3

### ** Examples

set.seed(123123)
## note: x4 is an unused variable in formula
X1a <-
    genCorrelatedData3("y ~ 1.1 + 2.1 * x1 + 3 * x2 + 3.5 * x3 + 1.1 * x1:x3",
                       N = 1000, means = c(x1 = 1, x2 = -1, x3 = 3, x4 = 1),
                       sds = 1, rho = 0.4, stde = 5)
lm1a <- lm(y ~ x1 + x2 + x3 + x1:x3, data = X1a)
## note that normal errors have std.error. close to 5
summary(lm1a)
attr(X1a, "beta") 
attr(X1a, "formula")
## Demonstrate name beta vector method to provide named arguments
set.seed(123123)
X2 <- genCorrelatedData3(N = 1000, means = c(x1 = 1, x2 = -1, x3 = 3, x4 = 1),
          sds = 1, rho = 0.4, 
          beta = c("Intercept" = 1.1, x1 = 2.1, x2 = 3,
                    x3 = 3.5, "x1:x3" = 1.1),
                    intercept = TRUE, stde = 5)
attr(X2, c("beta"))
attr(X2, c("formula"))
head(X2)
lm2 <- lm(y ~ x1 + x2 + x3 + x1:x3, data = X2)
summary(lm2)

## Equivalent with unnamed beta vector. Must carefully count empty
## spots, fill in 0's when coefficient is not present. This
## method was in genCorrelated2. Order of coefficents is
## c(intercept, x1, ..., xp, x1:x1, x1:x2, x1:xp, x2:x2, x2:x3, ..., )
## filling in a lower triangle.
set.seed(123123)
X3 <- genCorrelatedData3(N = 1000, means = c(x1 = 1, x2 = -1, x3 = 3, x4 = 1),
          sds = 1, rho = 0.4, 
          beta = c(1.1, 2.1, 3, 3.5, 0, 0, 0, 1.1),
                    intercept = TRUE, stde = 5)
attr(X3, c("beta"))
attr(X3, c("formula"))
head(X3)
lm3 <- lm(y ~ x1 + x2 + x3 + x1:x3, data = X3)
summary(lm3)

## Same with more interesting variable names in the means vector
X3 <- genCorrelatedData3(N = 1000,
          means = c(friend = 1, enemy = -1, ally = 3, neutral = 1),
          sds = 1, rho = 0.4, 
          beta = c(1.1, 2.1, 3, 3.5, 0, 0, 0, 1.1),
                    intercept = TRUE, stde = 5)
head(X3)
attr(X3, c("beta"))


X3 <- genCorrelatedData3(N = 1000, means = c(x1 = 50, x2 = 50, x3 = 50),
          sds = 10, rho = 0.4,
          beta = c("Intercept" = .1, x1 = .01, x2 = .2, x3 = .5,
                   "x1:x3" = .1))
lm3 <- lm(y ~ x1 + x2 + x3 + x1:x3, data = X3)


## Names via col.names argument: must match formula
X2 <- genCorrelatedData3("y ~ 1.1 + 2.1 * educ + 3 * hlth + 3 * ses + 1.1 * educ:ses",
         N = 100, means = c(50, 50, 50, 20),
         sds = 10, rho = 0.4, col.names = c("educ", "hlth", "ses", "wght"))
str(X2) 

X3 <- genCorrelatedData3("y ~ 1.1 + 2.1 * educ + 3 * hlth + 3 * ses + 1.1 * educ:ses",
         N = 100, means = c(50, 50, 50, 20),
         sds = 10, rho = 0.4, col.names = c("educ", "hlth", "ses", "wght"),
         intercept = TRUE)
str(X3)

## note the logistic errors have residual std.error approximately 5 * pi/sqrt(3)
X1b <-
    genCorrelatedData3("y ~ 1.1 + 2.1 * x1 + 3 * x2 + 3.5 * x3 + 1.1 * x1:x3",
                       N = 1000, means = c(x1 = 1, x2 = -1, x3 = 3),
                       sds = 1, rho = 0.4, stde = 5, distrib = rlogis)
lm1b <- lm(y ~ x1 + x2 + x3 + x1:x3, data = X1b)
summary(lm1b)

## t distribution is very sensitive for fractional df between 1 and 2 (recall
## stde parameter is passed through to df in rt.
X1c <-
    genCorrelatedData3("y ~ 1.1 + 2.1 * x1 + 3 * x2 + 3.5 * x3 + 1.1 * x1:x3",
                       N = 1000, means = c(x1 = 1, x2 = -1, x3 = 3),
                       sds = 1, rho = 0.4, stde = 1.2, distrib = rt)
lm1c <- lm(y ~ x1 + x2 + x3 + x1:x3, data = X1c)
summary(lm1c)




