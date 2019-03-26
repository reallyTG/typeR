library(metaMA)


### Name: row.ttest.statp
### Title: Row paired t-tests
### Aliases: row.ttest.statp
### Keywords: methods models

### ** Examples

## The function is currently defined as
function(mat){ 
m<-rowMeans(mat,na.rm=TRUE) 
sd<-rowSds(mat,na.rm=TRUE)  
tstat<-m/(sd*sqrt(1/dim(mat)[2])) 
return(tstat)}



