library(rrcov)


### Name: Linda
### Title: Robust Linear Discriminant Analysis
### Aliases: Linda Linda.formula Linda.default
### Keywords: robust multivariate

### ** Examples

## Example anorexia
library(MASS)
data(anorexia)

## start with the classical estimates
lda <- LdaClassic(Treat~., data=anorexia)
predict(lda)@classification

## try now the robust LDA with the default method (MCD with pooled whitin cov matrix)
rlda <- Linda(Treat~., data= anorexia)
predict(rlda)@classification

## try the other methods
Linda(Treat~., data= anorexia, method="mcdA")
Linda(Treat~., data= anorexia, method="mcdB")
Linda(Treat~., data= anorexia, method="mcdC")

## try the Hawkins&McLachlan method
## use the default method
grp <- anorexia[,1]
grp <- as.factor(grp)
x <- anorexia[,2:3]
Linda(x, grp, method="fsa")

## Do DA with Linda and method mcdB or mcdC, when some classes
## have very few observations. Use L1 median instead of MCD
##  to compute the group means (l1med=TRUE).

data(fish)

# remove observation #14 containing missing value
fish <- fish[-14,]

# The height and width are calculated as percentages 
#   of the third length variable
fish[,5] <- fish[,5]*fish[,4]/100
fish[,6] <- fish[,6]*fish[,4]/100

table(fish$Species) 
Linda(Species~., data=fish, l1med=TRUE)
Linda(Species~., data=fish, method="mcdC", l1med=TRUE)




