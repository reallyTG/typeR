library(tableMatrix)


### Name: getRowDim.tableMatrix
### Title: Get row dimensions
### Aliases: getRowDim.tableMatrix

### ** Examples


data(images8By8)
data(images10By10)

# Create tableMatrix from images8By8 and images10By10
TM <- tableMatrix(list(images8By8, images10By10), 
list(r=c(1,3), r=c(1,3)),
list(r=c(4,ncol(images8By8)),r=c(4,ncol(images10By10))),list(c(8,8),c(10,10)),
dimNames =c("dimX", "dimY"))
matDim(TM)
tab(TM) 

# Dimensions corresponding to row 1 in tab(TM)
getRowDim(TM, 1)

# Dimensions corresponding to row 91 in tab(TM)
getRowDim(TM, 91)

# Dimensions corresponding to row 1 in second matrix in mat(TM)
getRowDim(TM, repo=c(2,1))




