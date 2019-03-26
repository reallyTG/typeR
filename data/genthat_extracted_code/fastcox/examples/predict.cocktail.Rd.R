library(fastcox)


### Name: predict.cocktail
### Title: make predictions from a "cocktail" object.
### Aliases: predict.cocktail predict.survpath
### Keywords: models regression

### ** Examples

data(FHT)
m1<-cocktail(x=FHT$x,y=FHT$y,d=FHT$status,alpha=0.5)
predict(m1,type="nonzero")
predict(m1,newx=FHT$x[1:5,],type="response")



