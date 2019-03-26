library(agricolae)


### Name: carolina
### Title: North Carolina Designs I, II and III
### Aliases: carolina
### Keywords: models

### ** Examples


library(agricolae)
data(DC)
carolina1 <- DC$carolina1
# str(carolina1)
output<-carolina(model=1,carolina1)
output[][-1]

carolina2 <- DC$carolina2
# str(carolina2)
majes<-subset(carolina2,carolina2[,1]==1)
majes<-majes[,c(2,5,4,3,6:8)]
output<-carolina(model=2,majes[,c(1:4,6)])
output[][-1]

carolina3 <- DC$carolina3
# str(carolina3)
output<-carolina(model=3,carolina3)
output[][-1]



