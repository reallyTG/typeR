library(adegenet)


### Name: H3N2
### Title: Seasonal influenza (H3N2) HA segment data
### Aliases: H3N2 usflu usflu.fasta USflu USflu.fasta
### Keywords: datasets

### ** Examples


## Not run: 
##D #### H3N2 ####
##D ## LOAD DATA
##D data(H3N2)
##D H3N2
##D 
##D ## set population to yearly epidemics
##D pop(H3N2) <- factor(H3N2$other$epid)
##D 
##D 
##D 
##D ## PERFORM DAPC - USE POPULATIONS AS CLUSTERS
##D ## to reproduce exactly analyses from the paper, use "n.pca=1000"
##D dapc1 <- dapc(H3N2, all.contrib=TRUE, scale=FALSE, n.pca=150, n.da=5)
##D dapc1
##D 
##D ## (see ?dapc for details about the output)
##D 
##D 
##D ## SCREEPLOT OF EIGENVALUES
##D barplot(dapc1$eig, main="H3N2 - DAPC eigenvalues")
##D 
##D 
##D ## SCATTERPLOT (axes 1-2)
##D scatter(dapc1, posi.da="topleft", cstar=FALSE, cex=2, pch=17:22,
##D solid=.5, bg="white")
##D 
##D 
##D 
##D 
##D #### usflu.fasta ####
##D myPath <- system.file("files/usflu.fasta",package="adegenet")
##D myPath
##D 
##D ## extract SNPs from alignments using fasta2genlight
##D ## see ?fasta2genlight for more details
##D obj <- fasta2genlight(myPath, chunk=10) # process 10 sequences at a time
##D obj
## End(Not run)




