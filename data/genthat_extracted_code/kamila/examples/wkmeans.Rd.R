library(kamila)


### Name: wkmeans
### Title: Weighted k-means for mixed-type data
### Aliases: wkmeans

### ** Examples

# Generate toy data set with poor quality categorical variables and good
# quality continuous variables.
set.seed(1)
dat <- genMixedData(200, nConVar=2, nCatVar=2, nCatLevels=4, nConWithErr=2,
  nCatWithErr=2, popProportions=c(.5,.5), conErrLev=0.3, catErrLev=0.8)
catDf <- data.frame(apply(dat$catVars, 2, factor))
conDf <- data.frame(scale(dat$conVars))

# A clustering that emphasizes the continuous variables
r1 <- with(dat,wkmeans(conDf, catDf, 0.9, 2))
table(r1$cluster, dat$trueID)

# A clustering that emphasizes the categorical variables; note argument
# passed to the underlying stats::kmeans function
r2 <- with(dat,wkmeans(conDf, catDf, 0.1, 2, nstart=4))
table(r2$cluster, dat$trueID)



