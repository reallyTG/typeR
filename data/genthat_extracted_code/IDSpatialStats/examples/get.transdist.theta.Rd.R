library(IDSpatialStats)


### Name: get.transdist.theta
### Title: Get weights of transmission distance theta
### Aliases: get.transdist.theta

### ** Examples

case.times <- c(1,2,2,3,3)
gen <- c(0, 2/3, 1/3, 0, 0)
t.density <- gen/sum(gen)

gen.time <- 2 # mean generation time

wt <- est.wt.matrix(case.times=case.times, gen.t.dist=t.density)

ngen <- round((max(case.times) - min(case.times)) / gen.time) + 1 # Number of generations

a <- get.transdist.theta(wal.teun.mat=wt,
                         cases=case.times,
                         gen.t.mean=gen.time,
                         max.sep=ngen*2)



