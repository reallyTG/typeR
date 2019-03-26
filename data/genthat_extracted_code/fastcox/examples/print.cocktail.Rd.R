library(fastcox)


### Name: print.cocktail
### Title: print a cocktail object
### Aliases: print.cocktail
### Keywords: models regression

### ** Examples

data(FHT)
m1<-cocktail(x=FHT$x,y=FHT$y,d=FHT$status,alpha=0.5)
print(m1)



