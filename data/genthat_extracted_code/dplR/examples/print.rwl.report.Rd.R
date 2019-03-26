library(dplR)


### Name: print.rwl.report
### Title: Do some reporting on a RWL object
### Aliases: print.rwl.report
### Keywords: manip

### ** Examples

data("gp.rwl")
rwl.report(gp.rwl)
foo <- gp.rwl
foo[177,1] <- NA 
foo[177:180,3] <- NA 
foo[185,4] <- 0.001 
rwl.report(foo)



