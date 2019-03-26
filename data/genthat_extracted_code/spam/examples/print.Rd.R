library(spam)


### Name: print
### Title: Printing and summarizing sparse matrices
### Aliases: print.spam print,spam-method print.spam.chol
###   print.spam.chol.NgPeyton summary.spam summary,spam-method
###   summary.spam.chol summary.spam.chol.NgPeyton
### Keywords: hplot

### ** Examples

set.seed(13)
nz <- 8
ln <- nz
smat <- spam(0,ln,ln)
smat[cbind(sample(ln,nz),sample(ln,nz))] <- 1:nz

par(mfcol=c(1,2),pty='s')
options(spam.printsize=1000)
print(smat)
options(spam.printsize=10)
print(smat)
summary(smat)
(summary(smat))



