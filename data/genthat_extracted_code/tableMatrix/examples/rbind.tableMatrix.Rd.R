library(tableMatrix)


### Name: rbind.tableMatrix
### Title: Combine by rows
### Aliases: rbind.tableMatrix

### ** Examples


data(images8By8)
dim(images8By8)

data(images10By10)
dim(images10By10) 

# Create tableMatrix objects from images8By8 and images10By10
TM1 <- tableMatrix(images8By8, 1:3, 4:ncol(images8By8))
TM2 <- tableMatrix(images10By10, 1:3, 4:ncol(images10By10))

# Combining tableMatrix objects with same dimensions
TM <- rbind(TM1, TM1)
# Combined table part
tab(TM)
# One matrix in the matrix part
length(mat(TM))
# One dimension type
matDim(TM)

# Combining tableMatrix objects with different dimensions
TM <- rbind(TM1, TM2)
# Combined table part
tab(TM)
# Two matrices in the matrix part
length(mat(TM))
# Two dimension types
matDim(TM)




