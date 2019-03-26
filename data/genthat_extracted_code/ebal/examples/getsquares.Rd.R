library(ebal)


### Name: getsquares
### Title: Generate Matrix of Squared Terms
### Aliases: getsquares

### ** Examples

# create toy matrix
mold <- replicate(3,rnorm(50))
colnames(mold) <- paste("x",1:3,sep="")
head(mold)
# create new matrix
mnew <- getsquares(mold)
head(mnew)



