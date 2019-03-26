library(RSurveillance)


### Name: sep.passive
### Title: Passive surveillance sensitivity
### Aliases: sep.passive
### Keywords: methods

### ** Examples

# examples for sep.passive
sep.passive(c(0.1, 0.2, 0.9, 0.99), 0.98, 0.9, 1000, 5, 0.01)
sep.passive(c(0.1, 0.5, 0.95, 0.99), 0.98, 0.9, 1000, 5, 0.01)
step.p<- matrix(runif(30), nrow=10)
p.inf.u<- runif(10, 0.98, 0.999)
se<- mc2d::rpert(10, 0.9, 0.95, 0.98)
sep.passive(step.p, p.inf.u, se, 10000, 10, 0.02)



