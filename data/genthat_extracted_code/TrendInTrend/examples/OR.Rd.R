library(TrendInTrend)


### Name: OR
### Title: An Odds Ratio Estimation Function
### Aliases: OR

### ** Examples

## No test: 
data <- GenData()
n11 <- data[[1]]
n10 <- data[[2]]
n01 <- data[[3]]
n00 <- data[[4]]
results1 <- OR(n11,n10,n01,n00,bnull=c(-4,0,0))
results2 <- OR(n11,n10,n01,n00,bnull=c(-5,0,0))
results2 <- OR(n11,n10,n01,n00,bnull=c(-4,1,-1))
## End(No test)



