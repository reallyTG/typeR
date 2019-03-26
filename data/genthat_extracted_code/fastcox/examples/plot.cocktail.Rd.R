library(fastcox)


### Name: plot.cocktail
### Title: Plot coefficients from a "cocktail" object
### Aliases: plot.cocktail
### Keywords: models regression

### ** Examples

data(FHT)
m1<-cocktail(x=FHT$x,y=FHT$y,d=FHT$status,alpha=0.5)
par(mfrow=c(1,3))
plot(m1) # plots against the L1-norm of the coefficients
plot(m1,xvar="lambda",label=TRUE) # plots against the log-lambda sequence
plot(m1,color=TRUE)



