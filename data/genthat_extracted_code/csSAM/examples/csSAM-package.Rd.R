library(csSAM)


### Name: csSAM-package
### Title: Cell-specific Differential Expression (csSAM)
### Aliases: csSAM-package

### ** Examples

library("csSAM")
##
## Generate random dataset
##
set.seed(143)
k <- 5 # number of cell types
ng <- 500 # number of genes
p <- 20 # number of samples
ndiff <- 100 # number of genes differentially expressed

# true cell-specific signatures
H1 <- matrix(rnorm(5*ng), ncol=ng)
H2 <- H1
# create differential expression for 3rd cell type
H2[3,1:ndiff] <- H2[3,1:ndiff] + 5

# cell frequency matrix per sample
cc <- matrix(runif(p*k), ncol=k)
cc <- t(scale(t(cc), center=FALSE, scale=rowSums(cc)))
colnames(cc) <- paste('cellType', 1:ncol(cc), sep="")

# global expression matrix
G <- rbind(cc[1:10, ] %*% H1, cc[11:p, ] %*%H2 ) + matrix(rnorm(p*ng), ncol=ng)
# sample classes (2 groups)
y <- gl(2, p/2)

fileName = "Example File.pdf";
## Don't show: 
 on.exit(unlink(filename)) 
## End(Don't show)

# Now run, either using the wrapper
# NB: more permutations would be needed for real data
deconvResults = csSamWrapper(G, cc, y, nperms = 50, alternative = "two.sided"
								, standardize = TRUE
								, medianCenter = TRUE
								, fileName = fileName)

# Or by calling each function independently:
# this is useful if you want to perform only cell-specific expression
# without differential expression.
## Not run: 
##D numset = nlevels(y)
##D n <- summary(y, maxsum=Inf) # number of samples in each class
##D numgene = ncol(G)
##D numcell = ncol(cc)
##D geneID = colnames(G)
##D cellID = colnames(cc)
##D 
##D deconv <- list()
##D # run analysis
##D for (curset in levels(y))
##D 	deconv[[curset]]= csfit(cc[y==curset,], G[y==curset,])
##D 
##D rhat <- array(dim = c(numcell,numgene))
##D rhat[, ] <- csSAM(deconv[[1]]$ghat, deconv[[1]]$se,
##D                   n[1], deconv[[2]]$ghat, deconv[[2]]$se, n[2],
##D                   standardize=TRUE, medianCenter=TRUE, nonNeg=TRUE)
##D 
##D tt.sam <- runSAM(G, y)
##D falseDiscovR <- fdrCsSAM(G,cc,y,n,numcell,numgene, rhat,
##D                     nperms = 200,standardize=TRUE,alternative='two.sided',
##D                     medianCenter=TRUE, nonNeg=TRUE)
##D falseDiscovRSAM <- fdrSAM(G, y, nperms=200, alternative = 'two.sided',tt.sam)
##D sigGene <- findSigGene(G, cc, y, rhat, falseDiscovR)
##D 
##D plotCsSAM(falseDiscovR, falseDiscovRSAM,alternative='two.sided',cellID,numcell, fileName)
##D print (falseDiscovR$fdr.g[ , ] )
## End(Not run)



