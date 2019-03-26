library(pgsc)


### Name: pgsc.wald.test
### Title: A wrapper for the wald test of a restricted solution
### Aliases: pgsc.wald.test

### ** Examples

data("pgsc.dta")
g.i <- function(b) b[1] ; g.i.grad <- function(b) c(1,0)
sol.r <- pgsc(pgsc.dta, dep.var = 'y', indep.var = c('D1','D2'), 
b.init = c(0,1), method='onestep', g.i=g.i, g.i.grad=g.i.grad )
wald <- pgsc.wald.test( pgsc.dta, 'y', indep.var = c('D1','D2'), sol.r )
summary(wald)
plot(wald)



