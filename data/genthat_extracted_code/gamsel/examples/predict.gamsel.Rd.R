library(gamsel)


### Name: predict.gamsel
### Title: Gamsel Prediction Routine
### Aliases: predict.gamsel
### Keywords: regression smooth nonparametric

### ** Examples

data=gendata(n=500,p=12,k.lin=3,k.nonlin=3,deg=8,sigma=0.5)
attach(data)
bases=pseudo.bases(X,degree=10,df=6)
# Gaussian gam
gamsel.out=gamsel(X,y,bases=bases)
preds=predict(gamsel.out,X,index=20,type="terms")



