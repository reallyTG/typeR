library(metaSEM)


### Name: wls
### Title: Conduct a Correlation/Covariance Structure Analysis with WLS
### Aliases: wls tssem2
### Keywords: tssem

### ** Examples

#### Analysis of correlation structure
R1 <- matrix(c(1.00, 0.22, 0.24, 0.18,
               0.22, 1.00, 0.30, 0.22,
               0.24, 0.30, 1.00, 0.24,
               0.18, 0.22, 0.24, 1.00), ncol=4, nrow=4)
n <- 1000
acovR1 <- asyCov(R1, n)

## One-factor CFA model
(A1 <- cbind(matrix(0, nrow=5, ncol=4),
             matrix(c("0.2*a1","0.2*a2","0.2*a3","0.2*a4",0),
             ncol=1)))

(S1 <- Diag(c("0.2*e1","0.2*e2","0.2*e3","0.2*e4",1)))

## The first 4 variables are observed while the last one is latent.
(F1 <- create.Fmatrix(c(1,1,1,1,0), name="F1"))
wls.fit1 <- wls(Cov=R1, aCov=acovR1, n=n, Fmatrix=F1, Smatrix=S1, Amatrix=A1,
                 cor.analysis=TRUE, intervals="LB")
summary(wls.fit1)


#### Multiple regression analysis
## Variables in R2: y, x1, x2
R2 <- matrix(c(1.00, 0.22, 0.24, 
               0.22, 1.00, 0.30, 
               0.24, 0.30, 1.00, 
               0.18, 0.22, 0.24), ncol=3, nrow=3)
acovR2 <- asyCov(R2, n)

## A2: Regression coefficents
#    y x1 x2
# y  F T  T 
# x1 F F  F 
# x2 F F  F 
(A2 <- mxMatrix("Full", ncol=3, nrow=3, byrow=TRUE,
               free=c(FALSE, rep(TRUE, 2), rep(FALSE, 6)), name="A2"))

## S2: Covariance matrix of free parameters
#    y x1 x2
# y  T F  F 
# x1 F F  F 
# x2 F T  F
(S2 <- mxMatrix("Symm", ncol=3, nrow=3, values=c(0.2,0,0,1,0.2,1),
               free=c(TRUE,FALSE,FALSE,FALSE,TRUE,FALSE), name="S2"))

## F may be ignored as there is no latent variable.
wls.fit2 <- wls(Cov=R2, aCov=acovR2, n=n, Amatrix=A2, Smatrix=S2,
                cor.analysis=TRUE, intervals="LB")
summary(wls.fit2)


#### Analysis of covariance structure
R3 <- matrix(c(1.50, 0.22, 0.24, 0.18,
               0.22, 1.60, 0.30, 0.22,
               0.24, 0.30, 1.80, 0.24,
               0.18, 0.22, 0.24, 1.30), ncol=4, nrow=4)
n <- 1000
acovS3 <- asyCov(R3, n, cor.analysis=FALSE)

(A3 <- cbind(matrix(0, nrow=5, ncol=4),
             matrix(c("0.2*a1","0.2*a2","0.2*a3","0.2*a4",0),ncol=1)))

(S3 <- Diag(c("0.2*e1","0.2*e2","0.2*e3","0.2*e4",1)))

F3 <- c(TRUE,TRUE,TRUE,TRUE,FALSE)
(F3 <- create.Fmatrix(F3, name="F3", as.mxMatrix=FALSE))

wls.fit3 <- wls(Cov=R3, aCov=acovS3, n=n, Amatrix=A3, Smatrix=S3,
                Fmatrix=F3, cor.analysis=FALSE)
summary(wls.fit3)



