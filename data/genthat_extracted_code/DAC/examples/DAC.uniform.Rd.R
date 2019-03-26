library(DAC)


### Name: DAC.uniform
### Title: DAC For Uniform Benchmark Prior And Expert Priors
### Aliases: DAC.uniform

### ** Examples

y <- Turnover$actual.data
from <- -10 
to <- 10
by <- .01
xx <- seq(from, to, by)
priors <- matrix(NA,ncol=4,nrow=length(xx))
for(i in 1:4){
  priors[,i] <- dnorm(xx, Turnover$expert.priors[i ,1], Turnover$expert.priors[i, 2])
}
## No test: 
out <- DAC.uniform(from = from, to = to, by = by, data = Turnover$actual.data, 
                   priors = priors ,lb.bench = 0, ub.bench = 5, n.iter = 1000)
## End(No test)



