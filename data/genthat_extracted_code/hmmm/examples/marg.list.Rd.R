library(hmmm)


### Name: marg.list
### Title: lists of marginal sets
### Aliases: marg.list
### Keywords: models

### ** Examples

data(madsen)
marginals<-c("m-m-b-b","g-m-b-b","m-g-b-b","g-g-b-b")
margi<-marg.list(marginals,mflag="m")
names<-c("Inf","Sat","Co","Ho")
model<-hmmm.model(marg=margi,lev=c(3,3,2,4),names=names)
print(model)



