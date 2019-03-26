library(OBsMD)


### Name: PB12Des
### Title: 12-run Plackett-Burman Design Matrix
### Aliases: PB12Des
### Keywords: datasets

### ** Examples

library(OBsMD)
data(PB12Des,package="OBsMD")
str(PB12Des)
X <- as.matrix(PB12Des)
print(t(X)%*%X)



