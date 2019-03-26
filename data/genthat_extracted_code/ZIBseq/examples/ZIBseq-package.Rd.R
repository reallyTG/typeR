library(ZIBseq)


### Name: ZIBseq-package
### Title: Identify differentially abundant features
### Aliases: ZIBseq-package
### Keywords: package

### ** Examples

## Not run: 
##D data(testdata)
##D x=testdata[,9:248]
##D p=dim(x)[2]
##D for (i in 1:p){x[,i]=as.numeric(as.character(x[,i]))}
##D gr=testdata[,2]
##D gr=as.numeric(gr)
##D gr[which(gr<4)]=0
##D gr[which(gr==4)]=1
##D result=ZIBseq(data=x,outcome=gr)
## End(Not run)



