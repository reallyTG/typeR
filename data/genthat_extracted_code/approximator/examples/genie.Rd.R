library(approximator)


### Name: genie
### Title: Genie datasets for approximator package
### Aliases: genie Genie D1.genie hpa.genie z.genie subsets.genie
###   basis.genie hpa.fun.genie hpa.genie.start hpa.genie.optimal
### Keywords: datasets

### ** Examples

data(genie)
z.genie


jj <- list(trace=100,maxit=10)

hpa.genie.level1 <- opt.1(D=D1.genie, z=z.genie,
                          basis=basis.genie, subsets=subsets.genie,
                          hpa.start=hpa.genie.start,control=jj)
 
hpa.genie.level2 <- opt.gt.1(level=2, D=D1.genie, z=z.genie,
                          basis=basis.genie, subsets=subsets.genie,
                          hpa.start=hpa.genie.level1,control=jj)

hpa.genie.level3 <- opt.gt.1(level=3, D=D1.genie, z=z.genie,
                          basis=basis.genie, subsets=subsets.genie,
                          hpa.start=hpa.genie.level2,control=jj) 





