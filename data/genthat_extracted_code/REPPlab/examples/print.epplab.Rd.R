library(REPPlab)


### Name: print.epplab
### Title: Print an epplab Object
### Aliases: print,epplab-method print-method print.epplab
### Keywords: methods print

### ** Examples


library(tourr)
data(olive)
res <- EPPlab(olive[,3:10],PPalg="PSO",PPindex="KurtosisMin",n.simu=10, maxiter=20)
print(res)




