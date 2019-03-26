library(gamsel)


### Name: summary.gamsel
### Title: Gamsel summary routine
### Aliases: summary.gamsel
### Keywords: regression smooth nonparametric

### ** Examples

data=gendata(n=500,p=12,k.lin=3,k.nonlin=3,deg=8,sigma=0.5)
attach(data)
bases=pseudo.bases(X,degree=10,df=6)
# Gaussian gam
gamsel.out=gamsel(X,y,bases=bases)
par(mfrow=c(1,2),mar=c(5,4,3,1))
summary(gamsel.out)



