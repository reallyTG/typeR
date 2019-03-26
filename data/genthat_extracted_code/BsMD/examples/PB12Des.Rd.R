library(BsMD)


### Name: PB12Des
### Title: 12-run Plackett-Burman Design Matrix
### Aliases: PB12Des
### Keywords: datasets

### ** Examples

library(BsMD)
data(PB12Des,package="BsMD")
str(PB12Des)
X <- as.matrix(PB12Des)
print(t(X)%*%X)



