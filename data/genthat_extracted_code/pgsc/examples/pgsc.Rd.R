library(pgsc)


### Name: pgsc
### Title: Wrapper function for GSC estimation
### Aliases: pgsc

### ** Examples

data("pgsc.dta")
sol <- pgsc(pgsc.dta, dep.var = 'y', indep.var = c('D1','D2'), 
b.init = c(0,0), method='onestep' )
summary(sol)
g.i <- function(b) b[1] ; g.i.grad <- function(b) c(1,0)
sol.r <- pgsc(pgsc.dta, dep.var = 'y', indep.var = c('D1','D2'), 
b.init = sol$b, method='onestep', g.i=g.i, g.i.grad=g.i.grad )
summary(sol.r)



