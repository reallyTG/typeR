library(hmmm)


### Name: hmmm.chibar
### Title: chi-bar statistic test for hmm models
### Aliases: hmmm.chibar
### Keywords: htest

### ** Examples
data(polbirth)
# 1 = Politics; 2 = Birthcontrol
y<-getnames(polbirth,st=12,sep=";")                     
names<-c("Pol","Birth")
marglist<-c("l-m","m-l","l-l")
marginals<-marg.list(marglist,mflag="m")
ineq<-list(marg=c(1,2),int=list(c(1,2)),types=c("l","l"))

# definition of the model with inequalities on interactions in ineq
model<-hmmm.model(marg=marginals,dismarg=list(ineq),lev=c(7,4),names=names)

# saturated model
msat<-hmmm.mlfit(y,model)

# model with non-negative local log-odds ratios: "Likelihood ratio monotone dependence model"
mlr<-hmmm.mlfit(y,model,noineq=FALSE)

# model with null local log-odds ratios: "Stochastic independence model"
model0<-hmmm.model(marg=marginals,lev=c(7,4),sel=c(10:27),names=names)
mnull<-hmmm.mlfit(y,model0)

# HYPOTHESES TESTED:
#     testA --> H0=(mnull model) vs H1=(mlr model)
#     testB --> H0=(mlr model) vs H1=(msat model)

P<-hmmm.chibar(nullfit=mnull,disfit=mlr,satfit=msat)
summary(P)


