library(hmmm)


### Name: summary.hmmmfit
### Title: summary for the class hmmmfit
### Aliases: summary.hmmmfit
### Keywords: package

### ** Examples

data(relpol)
y<-getnames(relpol,st=12,sep=";")
# 1 = Religion, 2 = Politics
names<-c("Rel","Pol")
marglist<-c("l-m","m-g","l-g")
marginals<-marg.list(marglist,mflag="m")

# Hypothesis of stochastic independence: all log odds ratios are null 
model<-hmmm.model(marg=marginals,lev=c(3,7),sel=c(9:20),names=names)
fitmodel<-hmmm.mlfit(y,model)
# print(fitmodel,aname="Independence model",printflag=TRUE)
summary(fitmodel)



