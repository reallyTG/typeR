library(tableMatrix)


### Name: matDim.tableMatrix
### Title: Get or set matDim attribute
### Aliases: matDim.tableMatrix matDim<-.tableMatrix

### ** Examples


data(images8By8)
data(images10By10)

# Create tableMatrix from images8By8 and images10By10
TM <- tableMatrix(list(images8By8, images10By10), list(1:3, 1:3),
list(r=c(4,ncol(images8By8)),r=c(4,ncol(images10By10))))

# Dimensions part of TM
matDim(TM)

# Dimensions part of TM corresponding to matrix type 2
matDim(TM, 2)




