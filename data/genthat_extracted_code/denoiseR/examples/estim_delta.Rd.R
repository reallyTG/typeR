library(denoiseR)


### Name: estim_delta
### Title: Estimates delta for Iterated Stable Autoencoder
### Aliases: estim_delta

### ** Examples

 # A regularized Correspondence Analysis 
 ## Not run: 
##D library(FactoMineR)
##D  perfume <-  read.table("http://factominer.free.fr/docs/perfume.txt",header=TRUE,
##D  sep="\t",row.names=1)
##D  rownames(perfume)[4] <- "Cinema"
##D  
##D  isa.delt <- estim_delta(perfume, nbsim = 10, transformation = "CA")
##D  
##D  isa.ca <- ISA(perfume, delta = isa.delt$delta, noise = "Binomial", transformation = "CA")
##D  rownames(isa.ca$mu.hat) <- rownames(perfume)
##D  colnames(isa.ca$mu.hat) <- colnames(perfume)
##D  res.isa.ca <- CA(isa.ca$mu.hat, graph = FALSE)
##D  plot(res.isa.ca, title = "Regularized CA", cex = 0.6, selectCol = "contrib 20")
## End(Not run)



