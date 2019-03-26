library(tlmec)


### Name: UTIdata
### Title: Data set for Unstructured Treatment Interruption Study
### Aliases: UTIdata
### Keywords: datasets

### ** Examples

## Not run: 
##D  
##D ## load data
##D data(UTIdata)
##D 
##D ## Sort the data by Patient and  visit
##D o <- order(UTIdata$Patid, UTIdata$Fup)
##D UTIdata <- UTIdata[o,]
##D 
##D ## Create censure vector
##D cens = (UTIdata$RNAcens==1)+0
##D 
##D ## Generate response vector 
##D y = log10(UTIdata$RNA)
##D aa=y[cens==0]
##D 
##D ## Create the design matrices
##D 
##D x = cbind((UTIdata$Fup==0)+0, (UTIdata$Fup==1)+0, (UTIdata$Fup==3)+0, (UTIdata$Fup==6)+0, (UTIdata$Fup==9)+0, (UTIdata$Fup==12)+0, (UTIdata$Fup==18)+0, (UTIdata$Fup==24)+0)
##D z = matrix(rep(1, length(y)), ncol=1)
##D cluster = as.numeric(UTIdata$Patid)
##D 
##D ## Create the nj vector
##D nj<-matrix(0,72,1)
##D for (j in 1:72) {
##D nj[j]=sum(cluster==j)
##D }
##D 
##D ## Number of individuals  
##D m<-dim(nj)[1]
##D 
##D ## Call the tlmec with Normal mixed-effects 
##D out.N <- tlmec(cens,y,x,z,nj,family="Normal",criteria=TRUE)
##D 
##D ## Call the tlmec with Student-t mixed-effects 
##D out.T <- tlmec(cens,y,x,z,nj,nu=9,family="t",criteria=TRUE)
## End(Not run)



