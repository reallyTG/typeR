library(sparseLDA)


### Name: smda
### Title: Sparse mixture discriminant analysis
### Aliases: smda smda.default
### Keywords: classif multivariate

### ** Examples

# load data
data(penicilliumYES)
X <- penicilliumYES$X
Y <- penicilliumYES$Y
Z <- penicilliumYES$Z

## test samples
Iout <- c(3, 6, 9, 12)
Iout <- c(Iout, Iout+12, Iout+24)

## training data
Xtr <- X[-Iout,]
k <- 3
n <- dim(Xtr)[1]
Rj <- rep(4, 3)

## Normalize data
Xc <- normalize(Xtr)
Xn <- Xc$Xc
p <- dim(Xn)[2]

## perform SMDA with one non-zero loading for each discriminative
## direction
## Not run: 
##D smdaFit <- smda(x = Xn,
##D                 y = Y, 
##D                 Z = Z, 
##D                 Rj = Rj,
##D                 lambda = 1e-6,
##D                 stop = -5,
##D                 maxIte = 10,
##D                 tol = 1e-2)
##D 
##D # testing
##D Xtst <- X[Iout,]
##D Xtst <- normalizetest(Xtst, Xc)
##D 
##D test <- predict(smdaFit, Xtst)
## End(Not run)



