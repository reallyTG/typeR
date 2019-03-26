library(REPPlab)


### Name: summary.epplab
### Title: Summarize an epplab Object
### Aliases: summary,epplab-method summary-method summary.epplab
### Keywords: methods print

### ** Examples


library(tourr)
data(olive)
res <- EPPlab(olive[,3:10],PPalg="PSO",PPindex="KurtosisMin",n.simu=10, maxiter=20)
summary(res)




