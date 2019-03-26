library(metaSEM)


### Name: impliedR
### Title: Create or Generate the Model Implied Correlation or Covariance
###   Matrices
### Aliases: impliedR rimpliedR
### Keywords: utilities

### ** Examples

set.seed(100)

## A simple mediation model
## All are population parameters in the A matrix
A1 <- matrix(c(0, 0, 0,
               0.3, 0, 0,
               0.2, 0.4, 0), nrow=3, ncol=3, byrow=TRUE,
             dimnames=list(c("x", "m", "y"), c("x", "m", "y")))
A1             

## Variance of x is fixed at 1 while the other variances are free.
S1 <- matrix(c(1, 0, 0,
               0, "0.1*ErrVarM",0,
               0, 0, "0.1*ErrVarY"), nrow=3, ncol=3,
             dimnames=list(c("x", "m", "y"), c("x", "m", "y")))
S1

impliedR(Amatrix=A1, Smatrix=S1)

## SD of A1
A1SD <- matrix(c(0, 0, 0,
                 0.1, 0, 0,
                 0.1, 0.1, 0), nrow=3, ncol=3, byrow=TRUE,
               dimnames=list(c("x", "m", "y"), c("x", "m", "y")))
A1SD

rimpliedR(Amatrix=A1, Smatrix=S1, AmatrixSD=A1SD, k=2)

## A CFA model
A2 <- matrix(c(0, 0, 0, 0.3,
               0, 0, 0, 0.4,
               0, 0, 0, 0.5,
               0, 0, 0, 0), nrow=4, ncol=4, byrow=TRUE,
             dimnames=list(c("x1", "x2", "x3", "f"),
                           c("x1", "x2", "x3", "f")))
A2

## Variance of f is fixed at 1 while the other variances are free.
S2 <- matrix(c("0.1*Err1", 0, 0, 0,
                0, "0.1*Err2", 0, 0,
                0, 0, "0.1*Err3", 0,
                0, 0, 0, 1), nrow=4, ncol=4,
            dimnames=list(c("x1", "x2", "x3", "f"), c("x1", "x2", "x3", "f")))
S2

F2 <- create.Fmatrix(c(1,1,1,0), as.mxMatrix=FALSE)
F2

impliedR(Amatrix=A2, Smatrix=S2, Fmatrix=F2)

## SD of A2
A2SD <- matrix(c(0, 0, 0, 0.1,
                 0, 0, 0, 0.1,
                 0, 0, 0, 0.1,
                 0, 0, 0, 0), nrow=4, ncol=4, byrow=TRUE,
               dimnames=list(c("x1", "x2", "x3", "f"),
                             c("x1", "x2", "x3", "f")))               
A2SD

rimpliedR(Amatrix=A2, Smatrix=S2, Fmatrix=F2, AmatrixSD=A2SD, k=2)



