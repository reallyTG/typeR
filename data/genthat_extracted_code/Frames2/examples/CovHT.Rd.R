library(Frames2)


### Name: CovHT
### Title: Covariance estimator between two Horvitz - Thompson estimators
### Aliases: CovHT

### ** Examples

##########   Example 1   ##########
Indicators <- c(1, 2, 3, 4, 5)
X <- c(13, 18, 20, 14, 9)
Y <- c(2, 0.5, 1.2, 3.3, 2)
#Let draw two simple random samples without replacement of size 2
s <- sample(Indicators, 2)
sX <- X[s]
sY <- Y[s]
#Now, let calculate the associated probability matrix with first and
#second order inclusion probabilities
Ps <- matrix(c(0.4,0.2, 0.2,0.4), 2, 2)
CovHT(sX, sY, Ps)

##########   Example 2   ##########
data(DatA)
attach(DatA)
data(PiklA)
#Let calculate Horvitz - Thompson estimator for total of variable Clothing in Frame A.
HT(Clo, ProbA)
#Let calculate Horvitz - Thompson estimator for total of variable Feeding in Frame A.
HT(Feed, ProbA)
#And now, let compute the covariance between the previous estimators
CovHT(Clo, Feed, PiklA)



