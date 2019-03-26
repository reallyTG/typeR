library(mcc)


### Name: getAkmoment
### Title: Four moments of Pearson correlation under permutation
### Aliases: getAkmoment
### Keywords: Pearson correlation moments

### ** Examples

set.seed(1)
## simulate a data matrix with 300 rows and 30 columns
m=300
n=30
## assume x is a gene expression matrix with 300 genes, 30 samples
x=matrix(rnorm(m*n),m,n)
## y is the clinical response (continuous)
y=rnorm(n)
out=getAkmoment(x,y)
names(out)
out$final2[1:10]   ## the second moments for the first 10 genes

## y can also be dichotomuous 
y=c(rep(1,15),rep(2,15))
out.dia=getAkmoment(x,y)
out.dia$final4[1:10]



