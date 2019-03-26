library(stablelearner)


### Name: similarity_measures_regression
### Title: Similarity Measure Infrastructure for Stability Assessment with
###   Numerical Responses
### Aliases: similarity_measures_regression edist msdist rmsdist madist
###   qadist cprob ccc pcc cosine rbfkernel tanimoto
### Keywords: stability, similariy, measures

### ** Examples


## No test: 

set.seed(0)

library("partykit")

airq <- subset(airquality, !is.na(Ozone))
m1 <- ctree(Ozone ~ ., data = airq[sample(1:nrow(airq), replace = TRUE),])
m2 <- ctree(Ozone ~ ., data = airq[sample(1:nrow(airq), replace = TRUE),])

p1 <- predict(m1)
p2 <- predict(m2)

## euclidean distance
m <- edist()
m$measure(p1, p2)

## mean squared distance
m <- msdist()
m$measure(p1, p2)

## root mean squared distance
m <- rmsdist()
m$measure(p1, p2)

## mean absolute istance
m <- madist()
m$measure(p1, p2)

## quantile of absolute distance
m <- qadist()
m$measure(p1, p2)

## coverage probability
m <- cprob()
m$measure(p1, p2)

## gaussian radial basis function kernel
m <- rbfkernel()
m$measure(p1, p2)

## tanimoto coefficient
m <- tanimoto()
m$measure(p1, p2)

## cosine similarity
m <- cosine()
m$measure(p1, p2)

## concordance correlation coefficient
m <- ccc()
m$measure(p1, p2)

## pearson correlation coefficient
m <- pcc()
m$measure(p1, p2)

## End(No test)




