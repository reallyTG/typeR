library(Matrix)


### Name: BunchKaufman-methods
### Title: Bunch-Kaufman Decomposition Methods
### Aliases: BunchKaufman BunchKaufman-methods
###   BunchKaufman,dspMatrix-method BunchKaufman,dsyMatrix-method
### Keywords: methods

### ** Examples

data(CAex)
dim(CAex)
isSymmetric(CAex)# TRUE
CAs <- as(CAex, "symmetricMatrix")
if(FALSE) # no method defined yet for *sparse* :
   bk. <- BunchKaufman(CAs)
## does apply to *dense* symmetric matrices:
bkCA <- BunchKaufman(as(CAs, "denseMatrix"))
bkCA

image(bkCA)# shows how sparse it is, too
str(R.CA <- as(bkCA, "sparseMatrix"))
## an upper triangular 72x72 matrix with only 144 non-zero entries



