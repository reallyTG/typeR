library(hmmm)


### Name: loglin.model
### Title: define a log-linear model
### Aliases: loglin.model
### Keywords: models

### ** Examples
data(madsen)
y<-getnames(madsen)
names<-c("Infl","Sat","Co","Ho")

f<-~Co*Ho+Sat*Co+Infl*Co+Sat*Ho+Infl*Sat
model<-loglin.model(lev=c(3,3,2,4),formula=f,names=names)

# alternatively 
# model<-loglin.model(lev=c(3,3,2,4),
# int=list(c(3,4),c(2,3),c(1,3),c(2,4),c(1,2)),names=names)

mod<-hmmm.mlfit(y,model,maxit=3000)
print(mod,printflag=TRUE)



