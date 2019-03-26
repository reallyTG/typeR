library(gamsel)


### Name: plot.cv.gamsel
### Title: Plotting Routine for Gamsel Cross-Validation Object
### Aliases: plot.cv.gamsel
### Keywords: regression smooth nonparametric

### ** Examples

data=gendata(n=500,p=12,k.lin=3,k.nonlin=3,deg=8,sigma=0.5)
attach(data)
bases=pseudo.bases(X,degree=10,df=6)
# Gaussian gam
gamsel.out=gamsel(X,y,bases=bases)
gamsel.cv=cv.gamsel(X,y,bases=bases)
par(mfrow=c(1,1))
plot(gamsel.cv)



