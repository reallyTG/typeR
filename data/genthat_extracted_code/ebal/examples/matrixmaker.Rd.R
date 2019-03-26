library(ebal)


### Name: matrixmaker
### Title: Generate Matrix of One-way Interactions and Squared Terms
### Aliases: matrixmaker

### ** Examples


# create toy matrix
mold <- replicate(3,rnorm(50))
colnames(mold) <- paste("x",1:3,sep="")
head(mold)
# create new matrix
mnew <- matrixmaker(mold)
head(mnew)




