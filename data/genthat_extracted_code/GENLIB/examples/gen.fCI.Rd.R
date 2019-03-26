library(GENLIB)


### Name: gen.fCI
### Title: Average inbreeding coefficient confidence interval
### Aliases: gen.fCI
### Keywords: manip

### ** Examples

data(genea140) 
gen140<-gen.genealogy(genea140) 
gen10 <-gen.branching(gen140, pro=gen.pro(gen140)[c(1:10)])
fval<-gen.f(gen10)
gen.fCI(fval)



