library(LCA)


### Name: LCA
### Title: Localised Co-dependency Analysis
### Aliases: LCA

### ** Examples

## create a data matrix

x <- array(runif(1200),dim=c(40,12))

## implant similarity across a 'clique'

clique.cols <- sample(ncol(x),4)
x[,clique.cols] <- x[,clique.cols] + rnorm(nrow(x))

## scale x to (0,1)

x[x<0] <- 0
x[x>1] <- 1

## choose a 'seed' feature and some partner

seed.row <- sample(nrow(x),1)
partner.row <- sample(setdiff(c(1:nrow(x)),seed.row),1)

x[c(seed.row,partner.row),clique.cols] <- x[c(seed.row,partner.row),clique.cols] + 
rep(rnorm(length(clique.cols)),each=2)

## calibrate PTL models to dataset

PTL.fit <- fitPTLmodel(x,nPairs=15)

## evaluate LCD between 'seed' feature and all other features
 
LCA.result <- LCA(x,PTLmodel=PTL.fit,clique=clique.cols,seed.row=seed.row)
## Not run: head(LCA.result$LCD)




