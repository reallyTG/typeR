library(tableMatrix)


### Name: getRowRepo.tableMatrix
### Title: Get row repo
### Aliases: getRowRepo.tableMatrix

### ** Examples


data(images8By8)
data(images10By10)

# Create tableMatrix from images8By8 and images10By10
TM <- tableMatrix(list(images8By8, images10By10), list(1:3, 1:3),
list(c(4:ncol(images8By8)),c(4:ncol(images10By10))))
tab(TM)

# Row 2 in tab(TM) corresponds to first matrix, second row 
getRowRepo(TM, 2)

# Row 91 in tab(TM) corresponds to second matrix, first row 
getRowRepo(TM, 91)




