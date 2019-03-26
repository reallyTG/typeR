library(tableMatrix)


### Name: tab.tableMatrix
### Title: Get or set table attribute
### Aliases: tab.tableMatrix

### ** Examples


data(images8By8)
data(images10By10)

# Create tableMatrix from images8By8 and images10By10
TM <- tableMatrix(list(images8By8, images10By10), list(1:3, 1:3),
list(4:ncol(images8By8),4:ncol(images10By10)))
matDim(TM)

# Table part of TM
tab(TM)

# Table part of TM corresponding to matrix type 2
tab(TM, 2)

# Add row indexes
tab(TM, 2, TRUE)




