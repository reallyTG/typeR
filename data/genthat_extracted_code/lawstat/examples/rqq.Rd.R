library(lawstat)


### Name: rqq
### Title: Test of Normality using RQQ plots
### Aliases: rqq
### Keywords: robust

### ** Examples

## Simulate 100 observations: using rnorm() for 
## normally distributed data, Y=N(0,1)
y = rnorm(100)
rqq(y)

## Using michigan data
data(michigan)
rqq(michigan)




