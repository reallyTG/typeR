library(DAC)


### Name: DAC.normal
### Title: DAC For Normal Benchmark Prior And Expert Priors
### Aliases: DAC.normal

### ** Examples

y <- Turnover$actual.data
from <- -500 
to <- 500
by <- .01
xx <- seq(from, to, by)
priors <- matrix(NA,ncol=4,nrow=length(xx))
for(i in 1:4){
  priors[,i] <- dnorm(xx, Turnover$expert.priors[i ,1], Turnover$expert.priors[i, 2])
}
## No test: 
out <- DAC.normal(from = from, to = to, by = by, data = Turnover$actual.data, 
                   priors = priors ,mean.bench = 0, sd.bench = 100, n.iter = 1000)
## End(No test)




