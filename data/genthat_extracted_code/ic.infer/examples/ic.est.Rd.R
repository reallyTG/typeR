library(ic.infer)


### Name: ic.est
### Title: Functions for order-restricted estimates and printing thereof
### Aliases: ic.est print.orest summary.orest
### Keywords: multivariate optimize

### ** Examples

## different correlation structures
corr.plus <- matrix(c(1,0.9,0.9,1),2,2)
corr.null <- matrix(c(1,0,0,1),2,2)
corr.minus <- matrix(c(1,-0.9,-0.9,1),2,2)
## unrestricted vectors
x1 <- c(1, -1)
x2 <- c(-1, -1)
x3 <- c(10, -1)
## estimation under restriction non-negative orthant
## or first element equal to 0, second non-negative
ice <- ic.est(x1, corr.plus, ui=diag(c(1,1)), ci=c(0,0))
ice
summary(ice)
ice2 <-ic.est(x1, corr.plus, ui=diag(c(1,1)), ci=c(0,0), meq=1)
summary(ice2)
ic.est(x2, corr.plus, ui=diag(c(1,1)), ci=c(0,0))
ic.est(x2, corr.plus, ui=diag(c(1,1)), ci=c(0,0), meq=1)
ic.est(x3, corr.plus, ui=diag(c(1,1)), ci=c(0,0))
ic.est(x3, corr.plus, ui=diag(c(1,1)), ci=c(0,0), meq=1)
ic.est(x1, corr.null, ui=diag(c(1,1)), ci=c(0,0))
ic.est(x1, corr.null, ui=diag(c(1,1)), ci=c(0,0), meq=1)
ic.est(x2, corr.null, ui=diag(c(1,1)), ci=c(0,0))
ic.est(x2, corr.null, ui=diag(c(1,1)), ci=c(0,0), meq=1)
ic.est(x3, corr.null, ui=diag(c(1,1)), ci=c(0,0))
ic.est(x3, corr.null, ui=diag(c(1,1)), ci=c(0,0), meq=1)
ic.est(x1, corr.minus, ui=diag(c(1,1)), ci=c(0,0))
ic.est(x1, corr.minus, ui=diag(c(1,1)), ci=c(0,0), meq=1)
ic.est(x2, corr.minus, ui=diag(c(1,1)), ci=c(0,0))
ic.est(x2, corr.minus, ui=diag(c(1,1)), ci=c(0,0), meq=1)
ic.est(x3, corr.minus, ui=diag(c(1,1)), ci=c(0,0))
ic.est(x3, corr.minus, ui=diag(c(1,1)), ci=c(0,0), meq=1)
## estimation under one element restricted to being non-negative
ic.est(x3, corr.plus, ui=1, ci=0, index=1)
ic.est(x3, corr.plus, ui=1, ci=0, index=2)



