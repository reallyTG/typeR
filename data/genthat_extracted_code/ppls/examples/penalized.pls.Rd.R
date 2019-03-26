library(ppls)


### Name: penalized.pls
### Title: Penalized Partial Least Squares
### Aliases: penalized.pls
### Keywords: multivariate

### ** Examples

## example from the paper ##
# load BOD data
data(BOD)
X<-BOD[,1]
y<-BOD[,2]

Xtest=seq(min(X),max(X),length=200) # generate test data for plot
dummy<-X2s(X,Xtest,deg=3,nknot=20) # transformation of the data
Z=dummy$Z # transformed X data
Ztest=dummy$Ztest # transformed Xtest data
size=dummy$sizeZ # size of the transformed data
P<-Penalty.matrix(size,order=2)  # Penalty matrix
lambda<-200 # amount of penalization
number.comp<-3 # number of components

ppls<-penalized.pls(Z,y,P=lambda*P,ncomp=number.comp) # fit
new.ppls<-new.penalized.pls(ppls,Ztest)$ypred # prediction for test data
## plot fitted values for 2 components
plot(X,y,lwd=3,xlim=range(Xtest))
lines(Xtest,new.ppls[,2])



