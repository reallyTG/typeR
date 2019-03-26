library(dse)


### Name: ARMA
### Title: ARMA Model Constructor
### Aliases: ARMA is.ARMA
### Keywords: ts

### ** Examples

    mod1 <- ARMA(A=array(c(1,-.25,-.05), c(3,1,1)), B=array(1,c(1,1,1)))
    AR   <- array(c(1, .5, .3, 0, .2, .1, 0, .2, .05, 1, .5, .3) ,c(3,2,2))
    VAR  <- ARMA(A=AR, B=diag(1,2))
    C    <- array(c(0.5,0,0,0.2),c(1,2,2))
    VARX <- ARMA(A=AR, B=diag(1,2), C=C) 
    MA   <- array(c(1, .2, 0, .1, 0, 0, 1, .3), c(2,2,2)) 
    ARMA  <- ARMA(A=AR, B=MA, C=NULL) 
    ARMAX <- ARMA(A=AR, B=MA, C=C) 



