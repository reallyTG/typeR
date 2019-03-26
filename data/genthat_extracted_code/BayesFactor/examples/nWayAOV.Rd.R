library(BayesFactor)


### Name: nWayAOV
### Title: Use ANOVA design matrix to compute Bayes factors or sample
###   posterior
### Aliases: nWayAOV
### Keywords: htest

### ** Examples

## Classical example, taken from t.test() example
## Student's sleep data
data(sleep)
plot(extra ~ group, data = sleep)

## traditional ANOVA gives a p value of 0.00283
summary(aov(extra ~ group + Error(ID/group), data = sleep))

## Build design matrix
group.column <- rep(1/c(-sqrt(2),sqrt(2)),each=10)
subject.matrix <- model.matrix(~sleep$ID - 1,data=sleep$ID)
## Note that we include no constant column
X <- cbind(group.column, subject.matrix)

## (log) Bayes factor of full model against grand-mean only model
bf.full <- nWayAOV(y = sleep$extra, X = X, gMap = c(0,rep(1,10)), rscale=c(.5,1))
exp(bf.full[['bf']])

## Compare with lmBF result (should be about the same, give or take 1%)
bf.full2 <- lmBF(extra ~ group + ID, data = sleep, whichRandom = "ID")
bf.full2



