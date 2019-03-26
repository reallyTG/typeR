library(fastcox)


### Name: cocktail
### Title: Fits the regularization paths for the elastic net penalized
###   Cox's model
### Aliases: cocktail
### Keywords: models regression

### ** Examples

data(FHT)
m1<-cocktail(x=FHT$x,y=FHT$y,d=FHT$status,alpha=0.5)
predict(m1,type="nonzero")
plot(m1)



