library(psych)


### Name: glb.algebraic
### Title: Find the greatest lower bound to reliability.
### Aliases: glb.algebraic
### Keywords: multivariate

### ** Examples


Cv<-matrix(c(215, 64, 33, 22,
              64, 97, 57, 25,
              33, 57,103, 36,
              22, 25, 36, 77),ncol=4)

Cv                    # covariance matrix of a test with 4 subtests
Cr<-cov2cor(Cv)       # Correlation matrix of tests
if(!require(Rcsdp)) {print("Rcsdp must be installed to find the glb.algebraic")} else {
 glb.algebraic(Cv)     # glb of total score
glb.algebraic(Cr)      # glb of sum of standardized scores

 w<-c(1,2,2,1)         # glb of weighted total score
 glb.algebraic(diag(w) %*% Cv %*% diag(w))  
alphas <- c(0.8,0,0,0) # Internal consistency of first test is known

glb.algebraic(Cv,LoBounds=alphas*diag(Cv))

                      # Fix all diagonal elements to 1 but the first:

lb <- glb.algebraic(Cr,LoBounds=c(0,1,1,1),UpBounds=c(1,1,1,1))
lb$solution[1]        # should be the same as the squared mult. corr.
smc(Cr)[1] 
}                        




