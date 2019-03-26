library(MissMech)


### Name: Hawkins
### Title: Test Statistic for the Hawkins Homoscedasticity Test
### Aliases: Hawkins

### ** Examples

set.seed <- 50
n <- 200
p <- 4
pctmiss <- 0.2
y <- matrix(rnorm(n * p),nrow = n)
spatcnt <- c(20, 50, 70, 200)
h <- Hawkins(data=y, spatcnt)



