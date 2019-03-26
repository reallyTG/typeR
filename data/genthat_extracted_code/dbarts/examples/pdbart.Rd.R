library(dbarts)


### Name: pdbart
### Title: Partial Dependence Plots for BART
### Aliases: pdbart plot.pdbart pd2bart plot.pd2bart
### Keywords: nonparametric tree regression nonlinear dplot

### ** Examples

## Not run: 
##D ## simulate data 
##D f <- function(x) { return(0.5 * x[,1] + 2 * x[,2] * x[,3]) }
##D 
##D sigma <- 0.2
##D n     <- 100
##D 
##D set.seed(27)
##D x <- matrix(2 * runif(n * 3) -1, ncol = 3);
##D colnames(x) <- c('rob', 'hugh', 'ed')
##D 
##D Ey <- f(x)
##D y  <- rnorm(n, Ey, sigma)
##D 
##D ## first two plot regions are for pdbart, third for pd2bart
##D par(mfrow = c(1, 3))
##D 
##D ## pdbart: one dimensional partial dependence plot
##D set.seed(99)
##D pdb1 <-
##D   pdbart(x, y, xind = c(1, 2),
##D          levs = list(seq(-1, 1, 0.2), seq(-1, 1, 0.2)),
##D          pl = FALSE, keepevery = 10, ntree = 100)
##D plot(pdb1, ylim = c(-0.6,.6))
##D 
##D ## pd2bart: two dimensional partial dependence plot
##D set.seed(99)
##D pdb2 <-
##D   pd2bart(x, y, xind = c(2, 3),
##D           levquants = c(0.05, 0.1, 0.25, 0.5, 0.75, 0.9, 0.95),
##D           pl = FALSE, ntree = 100, keepevery = 10, verbose = FALSE)
##D plot(pdb2)
##D 
##D ## compare BART fit to linear model and truth = Ey
##D lmFit  <- lm(y ~., data.frame(x, y))
##D fitmat <- cbind(y, Ey, lmFit$fitted, pdb1$yhat.train.mean)
##D colnames(fitmat) <- c('y', 'Ey', 'lm', 'bart')
##D print(cor(fitmat))
## End(Not run)


