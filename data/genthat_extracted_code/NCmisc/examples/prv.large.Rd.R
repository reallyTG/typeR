library(NCmisc)


### Name: prv.large
### Title: Tidy display function for matrix objects
### Aliases: prv.large

### ** Examples

mat <- matrix(rnorm(1000),nrow=50)
rownames(mat) <- paste("ID",1:50,sep="")
colnames(mat) <- paste("Var",1:20,sep="")
prv.large(mat)
prv.large(mat,rows=9,cols=4,digits=1,rlab="samples",clab="variables",rownums=FALSE)



