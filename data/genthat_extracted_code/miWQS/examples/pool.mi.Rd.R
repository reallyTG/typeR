library(miWQS)


### Name: pool.mi
### Title: Pooling Multiple Imputation Results
### Aliases: pool.mi
### Keywords: imputation pool

### ** Examples

####Example 1: Sample Dataset 87, using 10% BDL Scenario
data(wqs.pool.test)
#Example of the \italics{to.pool} argument
head(wqs.pool.test)

#Pool WQS results and decrease in order of weights.
wqs.results.pooled <-   pool.mi(wqs.pool.test, n = 1000)
weight.dec <- c( order( wqs.results.pooled$pooled.mean[1:14], decreasing = TRUE), 15:16)
wqs.results.pooled <-  wqs.results.pooled[ weight.dec, ]
wqs.results.pooled

#When there is 1 estimate (p = 1)
a <-   pool.mi(wqs.pool.test[1, , , drop = FALSE], n = 1000)
a

#For single imputation (K = 1):
b<-   pool.mi(wqs.pool.test[ , , 1 , drop = FALSE], n = 1000)
b

#Odds ratio and 95% CI using the CLT.
odds.ratio <- exp( wqs.results.pooled[15:16, c("pooled.mean", "CI.1", "CI.2")] )
odds.ratio





