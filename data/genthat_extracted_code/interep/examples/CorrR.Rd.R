library(interep)


### Name: CorrR
### Title: This function obtains the correlation matrix of longitudinal
###   data
### Aliases: CorrR

### ** Examples

data("dat")
y=dat$y
n=dim(y)[1]
x=dat$x
data=reformat(y,x)
y=data$y
x=data$x
beta=dat$beta
corre='e'
k=rep(dat$k,n)
CorrR(y,x,beta,n,k,corre)



