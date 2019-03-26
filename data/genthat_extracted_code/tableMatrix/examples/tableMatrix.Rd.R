library(tableMatrix)


### Name: tableMatrix
### Title: tableMatrix constructor
### Aliases: tableMatrix

### ** Examples


data(images8By8)
dim(images8By8)

data(images10By10)
dim(images10By10)
images10By10DT <- data.table::as.data.table(images10By10)

# Generate tableMatrix from data.frame images8By8: use columns 1:3 as meta data and 
# columns 4:ncol(images8By8) as main data 
TM <- tableMatrix(images8By8, 1:3, 4:ncol(images8By8))
matDim(TM) # show matDim
tab(TM) # show meta data part of tableMatrix
head(mat(TM)[[1]]) # show head of main data part

# Generate tableMatrix from data.frame images8By8: use columns "direction" and "dimY"
# as meta data and columns 4:ncol(images8By8) as main data 
tableMatrix(images8By8, c("direction","dimY"), 4:ncol(images8By8))

# User defined dimensions with default names
TM <- tableMatrix(images8By8, c("direction","dimX","dimY"), 4:ncol(images8By8), c(8,8))
matDim(TM)

# User defined dimensions with custom names
dims <- c(8,8)
names(dims) <- c("dimX", "dimY")

TM <- tableMatrix(images8By8, 1:3, 4:ncol(images8By8), dims)
matDim(TM)

# tabCol and matCol list input with "j" option
# Column indices: first 3 columns in tab, rest in mat
tableMatrix(images8By8, list(j=1:3), list(j=4:ncol(images8By8)))
# Column names: columns "direction" and "dimY" in tab, 
# columns "pixel1" and "pixel2" in mat
tableMatrix(images8By8, list(j=c("direction","dimY")), list(j=c("pixel1","pixel2")))

# tabCol and matCol list input with "r" option
# Column indices: first 3 columns in tab, rest in mat
tableMatrix(images8By8, list(r=c(1,3)), list(r=c(4,ncol(images8By8))))
# Same with column names
tableMatrix(images8By8, list(r=c("direction","dimY")), list(r=c("pixel1","pixel100")))

# data.table as the start dataset
tableMatrix(images10By10DT, 1:3, 4:ncol(images10By10DT))

# data.frame and data.table with different main data parts -> two matrices in mat.
# Elements in tabCol and matCol lists correspond to images8By8 and images10By10DT
# respectively
TM <- tableMatrix(list(images8By8, images10By10DT),
list(r=c("direction","dimY"), j=c("direction","dimX","dimY")),
list(4:ncol(images8By8),4:ncol(images10By10DT)))
matDim(TM)
length(mat(TM)) # 2 matrices in mat

# User defined named dimensions
TM <- tableMatrix(list(images8By8, images10By10),
list(r=c("direction","dimY"), j=c("direction","dimX","dimY")),
list(c(4:ncol(images8By8)),c(4:ncol(images10By10))),list(c(8,8),c(10,10)),
dimNames =c("dimX", "dimY"))
matDim(TM)

# Same main data parts -> only one matrix in mat
TM <- tableMatrix(list(images8By8, images8By8), 
list(r=c("direction","dimY"), j=c("direction","dimX","dimY")),
list(j=4:ncol(images8By8),4:ncol(images8By8)))
matDim(TM)
length(mat(TM)) # 1 matrix in mat

# dataType support
TM <- tableMatrix(images10By10, 1:3, 4:ncol(images10By10), 
dataType=list("group1"="direction", "group2"=c("dimX","dimY")))
dataType(TM)




