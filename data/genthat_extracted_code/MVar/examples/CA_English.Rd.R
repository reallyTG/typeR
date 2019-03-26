library(MVar)


### Name: CA
### Title: Correspondence Analysis (CA).
### Aliases: CA
### Keywords: Simple Correspondence Analysis Multiple Correspondence
###   Analysis CA MCA

### ** Examples

data(DataFreq) # frequency data set

Data <- DataFreq[,2:ncol(DataFreq)]

rownames(Data) <- as.character(t(DataFreq[1:nrow(DataFreq),1]))

Resp <- CA(Data, "f") # performs CA

print("Is there dependency between rows and columns?"); Resp$DepData

print("Number of principal coordinates:"); Resp$NumCood

print("Principal coordinates of the rows:"); round(Resp$MatrixX,2)

print("Principal coordinates of the columns:"); round(Resp$MatrixY,2)

print("Inertia of the principal components:"); round(Resp$MatrixAutoVlr,2)



