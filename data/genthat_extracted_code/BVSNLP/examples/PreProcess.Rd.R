library(BVSNLP)


### Name: PreProcess
### Title: Preprocessing the design matrix, preparing it for variable
###   selection procedure
### Aliases: PreProcess

### ** Examples

### Constructing a synthetic design matrix for the purpose of preprocessing
### imposing columns with different scales
n <- 40
p1 <- 50
p2 <- 150
p <- p1 + p2
X1 <- matrix(rnorm(n*p1, 1, 2), ncol = p1)
X2 <- matrix(rnorm(n*p2), ncol = p2)
X <- cbind(X1, X2)

### putting NA elements in the matrix
X[3,85] <- NA
X[25,85] <- NA
X[35,43] <- NA
X[15,128] <- NA
colnames(X) <- paste("gene_",c(1:p),sep="")

### Running the function. Note the intercept column that is added as the
### first column in the "logistic" family
Xout <- PreProcess(X)
dim(Xout$X)[2] == (p + 1) ## 1 is added because intercept column is included
## This is FALSE because of the removal of columns with NA elements



