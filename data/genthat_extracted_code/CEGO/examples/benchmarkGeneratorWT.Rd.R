library(CEGO)


### Name: benchmarkGeneratorWT
### Title: Create single-machine total Weighted Tardiness (WT) Problem
###   Benchmark
### Aliases: benchmarkGeneratorWT

### ** Examples

n=6
#processing times
p <- sample(100,n,replace=TRUE)
#weights
w <- sample(10,n,replace=TRUE)
#due dates
RDD <- c(0.2, 0.4, 0.6,0.8,1.0)
TF <- c(0.2, 0.4, 0.6,0.8,1.0)
i <- 1
j <- 1
P <- sum(p)
d <- runif(n,min=P*(1-TF[i]-RDD[j]/2),max=P*(1-TF[i]+RDD[j]/2))
#create WT objective function
fun <- benchmarkGeneratorWT(p,w,d)
fun(1:n)
fun(n:1)	




