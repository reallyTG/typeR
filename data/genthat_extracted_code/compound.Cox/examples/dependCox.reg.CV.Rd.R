library(compound.Cox)


### Name: dependCox.reg.CV
### Title: Cox regression under dependent censoring.
### Aliases: dependCox.reg.CV
### Keywords: dependent censoring copula univariate Cox regression

### ** Examples

### Reproduce Section 5 of Emura and Chen (2016) ###
data(Lung)
temp=Lung[,"train"]==TRUE
t.vec=Lung[temp,"t.vec"]
d.vec=Lung[temp,"d.vec"]
X.mat=as.matrix(Lung[temp,-c(1,2,3)])
#dependCox.reg.CV(t.vec,d.vec,X.mat,G=20) # time-consuming process #



