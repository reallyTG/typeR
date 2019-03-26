library(expands)


### Name: simulation
### Title: Simulated heterogeneous samples
### Aliases: simulation
### Keywords: datasets

### ** Examples

data(simulation)
snvcols=c("chr", "startpos", "CN_Estimate", "AF_Tumor","PN_B")
cbscols=c("chr", "startpos", "endpos")
sI=1:50;#set to 1:200 to run on entire simulation
#out=runExPANdS(simulation[[1]]$snv[sI,snvcols],simulation[[1]]$cbs[,cbscols],plotF = 0);
#truePhy=buildPhylo(simulation[[1]]$cbs,outF='truePhylo'); ##simulated 
#predPhy=buildPhylo(out$sp_cbs,outF='truePhylo'); ##predicted
#par(mfrow=c(1,2))
#plot(truePhy$tree,cex=2,main='simulated')
#plot(predPhy$tree,cex=2,main='predicted')



