library(pgbart)


### Name: pdpgbart
### Title: Partial Dependence Plots for PGBART
### Aliases: pdpgbart plot.pdpgbart pd2pgbart plot.pd2pgbart

### ** Examples

## simulate data
f <- function(x) { return(0.5 * x[,1] + 2 * x[,2] * x[,3]) }
sigma <- 0.2
n <- 100
set.seed(27)
x <- matrix(2 * runif(n * 3) -1, ncol = 3)
colnames(x) <- c('rob', 'hugh', 'ed')
Ey <- f(x)
y <- rnorm(n, Ey, sigma)
## first two plot regions are for pdbart, third for pd2bart
par(mfrow = c(1, 3))
## pdbart: one dimensional partial dependence plot
set.seed(99)
pdb1 <-
  pdpgbart(
    x, y, xind=c(1,2),
    levs=list(seq(-1,1,.2), seq(-1,1,.2)), pl=FALSE,
    keepevery=10, ntree=5, nskip=100, ndpost=200
  )
plot(pdb1,ylim=c(-.6,.6))
## pd2bart: two dimensional partial dependence plot
set.seed(99)
pdb2 <-
  pd2pgbart(x, y, xind = c(2, 3),
          levquants = c(0.05, 0.1, 0.25, 0.5, 0.75, 0.9, 0.95),
          pl = FALSE, ntree = 5, keepevery = 10, verbose = FALSE
  )
plot(pdb2)



