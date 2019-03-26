library(denoiseR)


### Name: ISA
### Title: Iterated Stable Autoencoder
### Aliases: ISA

### ** Examples

Xsim <- LRsim(200, 500, 10, 4)
isa.gauss <- ISA(Xsim$X, sigma = 1/(4*sqrt(200*500)))
isa.gauss$nb.eigen

# isa.bin <- ISA(X, delta = 0.7, noise = "Binomial")

# A regularized Correspondence Analysis 
## Not run: 
##D library(FactoMineR)
##D  perfume <-  read.table("http://factominer.free.fr/docs/perfume.txt",
##D  header=TRUE,sep="\t",row.names=1)
##D  rownames(perfume)[4] <- "Cinema"
##D  isa.ca <- ISA(perfume, delta = 0.5, noise = "Binomial", transformation = "CA")
##D  rownames(isa.ca$mu.hat) <- rownames(perfume)
##D  colnames(isa.ca$mu.hat) <- colnames(perfume)
##D  res.isa.ca <- CA(isa.ca$mu.hat, graph = FALSE)
##D  plot(res.isa.ca, title = "Regularized CA", cex = 0.6, selectCol = "contrib 20")
##D  res.ca <- CA(perfume, graph = FALSE)
##D  plot(res.ca, title = "CA", cex = 0.6, selectCol = "contrib 20")
## End(Not run)



