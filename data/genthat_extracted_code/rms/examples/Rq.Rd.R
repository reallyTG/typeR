library(rms)


### Name: Rq
### Title: rms Package Interface to quantreg Package
### Aliases: Rq RqFit print.Rq latex.Rq predict.Rq
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D set.seed(1)
##D n <- 100
##D x1 <- rnorm(n)
##D y <- exp(x1 + rnorm(n)/4)
##D dd <- datadist(x1); options(datadist='dd')
##D fq2 <- Rq(y ~ pol(x1,2))
##D anova(fq2)
##D fq3 <- Rq(y ~ pol(x1,2), tau=.75)
##D anova(fq3)
##D pq2 <- Predict(fq2, x1)
##D pq3 <- Predict(fq3, x1)
##D p <- rbind(Median=pq2, Q3=pq3)
##D plot(p, ~ x1 | .set.)
##D # For superpositioning, with true curves superimposed
##D a <- function(x, y, ...) {
##D  x <- unique(x)
##D  col <- trellis.par.get('superpose.line')$col
##D  llines(x, exp(x), col=col[1], lty=2)
##D  llines(x, exp(x + qnorm(.75)/4), col=col[2], lty=2)
##D }
##D plot(p, addpanel=a)
## End(Not run)



