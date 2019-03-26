library(fastcox)


### Name: cv.cocktail
### Title: Cross-validation for cocktail
### Aliases: cv.cocktail cv.survpath
### Keywords: models regression

### ** Examples

data(FHT)
cv1<-cv.cocktail(x=FHT$x[,1:10],y=FHT$y,d=FHT$status,alpha=0.5,nfolds=3)
cv1
plot(cv1)



