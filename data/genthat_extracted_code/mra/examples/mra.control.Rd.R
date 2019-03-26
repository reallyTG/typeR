library(mra)


### Name: mra.control
### Title: mra.control - Control over MRA fitting process
### Aliases: mra.control
### Keywords: models

### ** Examples


data(dipper.histories)
ct <- as.factor( paste("T",1:ncol(dipper.histories), sep=""))
attr(ct,"nan")<-nrow(dipper.histories)
dipper.cjs <- F.cjs.estim( ~tvar(ct,drop=c(1,2)), ~tvar(ct,drop=c(1,6,7)), 
  dipper.histories, control=mra.control(trace=1, maxfn=200) )




