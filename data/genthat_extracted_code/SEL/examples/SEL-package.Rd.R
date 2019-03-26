library(SEL)


### Name: SEL-package
### Title: Semiparametric Elicitation of a bounded parameter.
### Aliases: SEL-package
### Keywords: package

### ** Examples

## example from O'Hagan et al. (2006)
x <- c(177.5, 183.75, 190, 205, 220)
y <- c(0.175, 0.33, 0.5, 0.75, 0.95)

default   <- SEL(x, y, Delta = 0.05, bounds = c(165, 250))
bernst    <- SEL(x, y, d = 10, N = 0, Delta = 0.05, bounds = c(165, 250))
unifknots <- SEL(x, y, d = 3, N = 5, Delta = 0.05, bounds = c(165, 250))
lin       <- SEL(x, y, d = 1, inknts = x, Delta = 0.05, bounds = c(165, 250))
comparePlot(default, bernst, unifknots, lin, type = "cdf")
comparePlot(default, bernst, unifknots, lin, type = "density")

## compare summaries
summary(default)
summary(bernst)
summary(unifknots)
summary(lin)

## sample from SEL object and evaluate density
xxx <- rvSEL(50000, bernst)
hist(xxx, breaks=100, freq=FALSE)
curve(predict(bernst, newdata=x), add=TRUE)





