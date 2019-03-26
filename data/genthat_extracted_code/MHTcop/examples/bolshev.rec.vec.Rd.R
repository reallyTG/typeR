library(MHTcop)


### Name: bolshev.rec.vec
### Title: Distribution function of the order statistics of i.i.d. uniform
###   random variables
### Aliases: bolshev.rec.vec

### ** Examples

bolshev.rec.vec(cbind(rev(c(0.7,0.8,0.9))))
#result: c(0.016, 0.079, 0.271)
#monte carlo simulation
sim <- function(v) mean(replicate(1e4,all(v <= sort(runif(3)))))
set.seed(0)
c(sim(c(0.7,0.8,0.9)),sim(c(0,0.8,0.9)),sim(c(0,0,0.9)))
#similar result: c(0.0176, 0.0799, 0.2709)



