library(gamsel)


### Name: plot.gamsel
### Title: Plotting Routine 'gamsel' Object
### Aliases: plot.gamsel
### Keywords: regression smooth nonparametric

### ** Examples

set.seed(1211)
data=gendata(n=500,p=12,k.lin=3,k.nonlin=3,deg=8,sigma=0.8)
attach(data)
bases=pseudo.bases(X,degree=10,df=6)
# Gaussian gam
gamsel.out=gamsel(X,y,bases=bases)
par(mfrow=c(3,4))
plot(gamsel.out,newx=X,index=20)



