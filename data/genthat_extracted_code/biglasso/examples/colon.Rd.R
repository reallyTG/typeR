library(biglasso)


### Name: colon
### Title: Gene expression data from colon-cancer patients
### Aliases: colon
### Keywords: datasets

### ** Examples

data(colon)
X <- colon$X
y <- colon$y
str(X)
dim(X)
X.bm <- as.big.matrix(X) # convert to big.matrix object
str(X.bm)
dim(X.bm)



