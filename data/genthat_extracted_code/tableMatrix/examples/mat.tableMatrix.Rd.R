library(tableMatrix)


### Name: mat.tableMatrix
### Title: Get or set matrix attribute
### Aliases: mat.tableMatrix mat<-.tableMatrix

### ** Examples


data(images8By8)

# Create tableMatrix from images8By8 and images10By10
TM <- tableMatrix(list(images8By8, images10By10), list(1:3, 1:3),
list(4:ncol(images8By8),4:ncol(images10By10)))

# Full matrix part of TM
mat(TM)

# Matrix part of TM corresponding to matrix type 2
mat(TM, 2)




