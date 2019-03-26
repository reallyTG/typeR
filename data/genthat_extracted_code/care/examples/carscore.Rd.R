library(care)


### Name: carscore
### Title: Estimate CAR Scores and Marginal Correlations
### Aliases: carscore
### Keywords: multivariate

### ** Examples

# load care library
library("care")

######

# empirical CAR scores for diabetes data
data(efron2004)
xnames = colnames(efron2004$x)
n = dim(efron2004$x)[1]

car = carscore(efron2004$x, efron2004$y, lambda=0)
car

# compare orderings

# variables ordered by squared CAR scores
xnames[order(car^2, decreasing=TRUE)]
# "bmi" "s5"  "bp"  "s3"  "s4"  "s6"  "sex" "age" "s2"  "s1" 

# compare with ordering by t-scores / partial correlations 
pcor = pcor.shrink(cbind(efron2004$y,efron2004$x), lambda=0, verbose=FALSE)[-1,1]
xnames[order(pcor^2, decreasing=TRUE)]
# "bmi" "bp"  "s5"  "sex" "s1"  "s2"  "s4"  "s6"  "s3"  "age"

# compare with ordering by marginal correlations 
mcor = cor(efron2004$y,efron2004$x)
#mcor = carscore(efron2004$x, efron2004$y, diagonal=TRUE, lambda=0)
xnames[order(mcor^2, decreasing=TRUE)]
# "bmi" "s5"  "bp"  "s4"  "s3"  "s6"  "s1"  "age" "s2"  "sex"

# decomposition of R^2
sum(car^2)
slm(efron2004$x, efron2004$y, lambda=0, lambda.var=0)$R2

# pvalues for empirical CAR scores
pval = 1-pbeta(car^2, shape1=1/2, shape2=(n-2)/2)
pval <= 0.05

######

# shrinkage CAR scores for Lu et al. (2004) data
data(lu2004)
dim(lu2004$x)    # 30 403

# compute shrinkage car scores
car = carscore(lu2004$x, lu2004$y)

# most important genes
order(car^2, decreasing=TRUE)[1:10]

# compare with empirical marginal correlations
mcor = cor(lu2004$y, lu2004$x)
order(mcor^2, decreasing=TRUE)[1:10]

# decomposition of R^2
sum(car^2) 
slm(lu2004$x, lu2004$y)$R2




