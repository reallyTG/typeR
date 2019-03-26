library(tableMatrix)


### Name: getRow.tableMatrix
### Title: Get or set row from the matrix attribute
### Aliases: getRow.tableMatrix setRow.tableMatrix

### ** Examples


data(images8By8)
data(images10By10)

# Create tableMatrix from images8By8 and images10By10
TM <- tableMatrix(list(images8By8, images10By10), list(1:3, 1:3),
list(4:ncol(images8By8),4:ncol(images10By10)))

# Row 91 in tab(TM) corresponds to second matrix, first row 
row <- getRow(TM, 91)

# Row 91 in tab(TM) corresponds to second matrix, first row 
getRow(TM, repo=c(2,1))

# Change matrix row corresponding to row 91 in tab(TM) 
TM <- setRow(TM, rep(2,length(row)), 91)
getRow(TM, 91)




