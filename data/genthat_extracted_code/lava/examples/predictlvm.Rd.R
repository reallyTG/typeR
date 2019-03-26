library(lava)


### Name: predictlvm
### Title: Predict function for latent variable models
### Aliases: predictlvm

### ** Examples

m <- lvm(c(x1,x2,x3)~u1,u1~z,
         c(y1,y2,y3)~u2,u2~u1+z)
latent(m) <- ~u1+u2
d <- simulate(m,10,"u2,u2"=2,"u1,u1"=0.5,seed=123)
e <- estimate(m,d)

## Conditional mean given covariates
predictlvm(e,c(x1,x2)~1)$mean
## Conditional variance of u1,y1 given x1,x2
predictlvm(e,c(u1,y1)~x1+x2)$var



