library(sda)


### Name: catscore
### Title: Estimate CAT Scores and t-Scores
### Aliases: catscore
### Keywords: multivariate

### ** Examples

# load sda library
library("sda")

################# 
# training data #
#################

# prostate cancer set
data(singh2002)

# training data
Xtrain = singh2002$x
Ytrain = singh2002$y
dim(Xtrain)


####################################################
# shrinkage t-score (DDA setting - no correlation) #
####################################################

tstat = catscore(Xtrain, Ytrain, diagonal=TRUE)
dim(tstat)
tstat[1:10,]


########################################################
# shrinkage CAT score (LDA setting - with correlation) #
########################################################

cat = catscore(Xtrain, Ytrain, diagonal=FALSE)
dim(cat)
cat[1:10,]




