library(TailRank)


### Name: biomarkerPowerTable
### Title: Power tables for the tail-rank test
### Aliases: biomarkerPowerTable
### Keywords: univar multivariate htest nonparametric

### ** Examples

stuff <- biomarkerPowerTable(10000, 20,
                               c(10, 20, 50, 100, 250, 500),
                               c(0.95, 0.99),
                               c(0.99, 0.95),
                               seq(0.1, 0.7, by=0.1))
lapply(stuff, summary)



