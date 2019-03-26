library(psych)


### Name: pairwiseCount
### Title: Count number of pairwise cases for a data set with missing (NA)
###   data and impute values.
### Aliases: pairwiseCount count.pairwise pairwiseDescribe pairwiseReport
###   pairwiseImpute
### Keywords: models multivariate

### ** Examples


x <- matrix(rnorm(900),ncol=6)
y <- matrix(rnorm(450),ncol=3)
x[x < 0] <- NA
y[y > 1] <- NA

pairwiseCount(x)
pairwiseCount(y)
pairwiseCount(x,y)
pairwiseCount(x,diagonal=FALSE)
pairwiseDescribe(x,quant=c(.1,.25,.5,.75,.9))

#examine the structure of the ability data set
keys <- list(ICAR16=colnames(ability),reasoning =  cs(reason.4,reason.16,reason.17,reason.19),
  letters=cs(letter.7, letter.33,letter.34,letter.58, letter.7), 
  matrix=cs(matrix.45,matrix.46,matrix.47,matrix.55), 
  rotate=cs(rotate.3,rotate.4,rotate.6,rotate.8))
 pairwiseImpute(keys,ability)

    



