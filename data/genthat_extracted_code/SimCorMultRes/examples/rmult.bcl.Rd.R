library(SimCorMultRes)


### Name: rmult.bcl
### Title: Simulating Correlated Nominal Responses Conditional on a
###   Marginal Baseline-Category Logit Model Specification
### Aliases: rmult.bcl

### ** Examples

## See Example 3.1 in the Vignette.
betas <- c(1, 3, 2, 1.25, 3.25, 1.75, 0.75, 2.75, 2.25, 0, 0, 0)
N <- 500
ncategories <- 4
clsize <- 3
set.seed(1)
x1 <- rep(rnorm(N), each = clsize)
x2 <- rnorm(N * clsize)
xdata <- data.frame(x1, x2)
cor.matrix <- kronecker(toeplitz(c(1, rep(0.95, clsize - 1))), diag(ncategories))
CorNorRes <- rmult.bcl(clsize = clsize, ncategories = ncategories, betas = betas,
    xformula = ~x1 + x2, xdata = xdata, cor.matrix = cor.matrix)
suppressPackageStartupMessages(library('multgee'))
fit <- nomLORgee(y ~ x1 + x2, data = CorNorRes$simdata, id = id, repeated = time,
    LORstr = 'time.exch')
round(coef(fit), 2)




