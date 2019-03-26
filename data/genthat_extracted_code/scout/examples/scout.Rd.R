library(scout)


### Name: scout
### Title: Covariance-regularized regression, aka the Scout.
### Aliases: scout

### ** Examples

library(lars)
data(diabetes)
attach(diabetes)
scout.out <- scout(x2,y,p1=2,p2=1)
print(scout.out)
detach(diabetes)



