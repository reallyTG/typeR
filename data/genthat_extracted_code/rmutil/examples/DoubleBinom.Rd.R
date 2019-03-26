library(rmutil)


### Name: Double Binomial
### Title: Double Binomial Distribution
### Aliases: ddoublebinom pdoublebinom qdoublebinom rdoublebinom
### Keywords: distribution

### ** Examples

# compute P(45 < y < 55) for y double binomial(100,0.5,1.1)
sum(ddoublebinom(46:54, 100, 0.5, 1.1))
pdoublebinom(54, 100, 0.5, 1.1)-pdoublebinom(45, 100, 0.5, 1.1)
pdoublebinom(2,10,0.5,1.1)
qdoublebinom(0.05,10,0.5,1.1)
rdoublebinom(10,10,0.5,1.1)



