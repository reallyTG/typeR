library(lava)


### Name: stack.estimate
### Title: Stack estimating equations
### Aliases: stack.estimate

### ** Examples

m <- lvm(z0~x)
Missing(m, z ~ z0) <- r~x
distribution(m,~x) <- binomial.lvm()
p <- c(r=-1,'r~x'=0.5,'z0~x'=2)
beta <- p[3]/2
d <- sim(m,500,p=p)
m1 <- estimate(r~x,data=d,family=binomial)
d$w <- d$r/predict(m1,type="response")
m2 <- estimate(z~1, weights=w, data=d)
(e <- stack(m1,m2,propensity=TRUE))



