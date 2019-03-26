library(FlexDir)


### Name: FD.subcomposition
### Title: Subcomposition
### Aliases: FD.subcomposition

### ** Examples

data(oliveoil)
dataoil <- oliveoil
head(dataoil)
data <- FD.normalization(dataoil[,3:10])
head(data)
data.sub <- FD.subcomposition(data,c(1,3,4,5))
head(data.sub)
data.amalg <- FD.amalgamation(data,c(2,6,7,8),name='others')
head(data.amalg)




