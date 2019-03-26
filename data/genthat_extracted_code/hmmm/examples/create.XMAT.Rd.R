library(hmmm)


### Name: create.XMAT
### Title: design matrix for a hmm model
### Aliases: create.XMAT
### Keywords: models

### ** Examples
data(accident)
y<-getnames(accident,st=9,sep=";")
# responses: 1 = Type, 2 = Time; covariates: 3 = Age, 4 = Hour

marglist<-c("l-m","m-g","l-g")
marginals<-marg.list(marglist,mflag="m")
names<-c("Type","Time")

modelsat<-hmmm.model(marg=marginals,lev=c(3,4),
strata=6, names=names) 

# Create X to account for additive effect of Age and Hour on the logits of Type and Time
# and constant association between Type and Time
al<-list(Type=~Type*(Age+Hour),
Time=~Time*(Age+Hour),Type.Time=~Type.Time)
# list of matrices (replace=FALSE)
listmat<-create.XMAT(modelsat,Formula=al,strata=c(3,2),fnames=c("Age","Hour"),replace=FALSE)

# the model obtained by the modified X (replace=TRUE)
model<-create.XMAT(modelsat,Formula=al,strata=c(3,2),fnames=c("Age","Hour")) 
fitmodel<-hmmm.mlfit(y,model,y.eps=0.00001,maxit=2000)
print(fitmodel)



