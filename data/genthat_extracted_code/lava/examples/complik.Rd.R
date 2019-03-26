library(lava)


### Name: complik
### Title: Composite Likelihood for probit latent variable models
### Aliases: complik
### Keywords: models regression

### ** Examples

m <- lvm(c(y1,y2,y3)~b*x+1*u[0],latent=~u)
ordinal(m,K=2) <- ~y1+y2+y3
d <- sim(m,50,seed=1)
e1 <- complik(m,d,control=list(trace=1),type="all")



