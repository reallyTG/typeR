library(fma)


### Name: auto
### Title: Attributes of some US and Japanese automobiles
### Aliases: auto
### Keywords: datasets

### ** Examples
plot(Price ~ Mileage, data=auto,pch=19,col=2)
points(auto$Mileage[auto$Country=="USA"],auto$Price[auto$Country=="USA"],pch=19,col=4)
legend(30,25000,legend=c("USA","Japan"),pch=19,col=c(4,2))



