library(heavy)


### Name: heavyLm
### Title: (Multivariate) linear regression under heavy-tailed
###   distributions
### Aliases: heavyLm
### Keywords: regression models

### ** Examples

# univariate linear regression
data(ereturns)
fit <- heavyLm(m.marietta ~ CRSP, data = ereturns, family = Student(df = 5))
summary(fit)

# multivariate linear regression
data(dialyzer)
fit <- heavyLm(cbind(y1,y2,y3,y4) ~ -1 + centre, data = dialyzer, family = slash(df = 4))
fit



