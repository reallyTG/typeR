library(graphscan)


### Name: cluster
### Title: Performs cluster analysis on 'graphscan' class object.
### Aliases: cluster
### Keywords: spatial cluster DNA mutation

### ** Examples

## Not run: 
##D # 1d example with 2 fasta format files 
##D # containing each 2 DNA aligned sequences.
##D dna_file<-list.files(path=system.file("extdata",package="graphscan"),
##D                      pattern="fna",full.names=TRUE)
##D g1<-graphscan_1d(data=dna_file)
##D g1<-cluster(g1)
##D 
##D # 2d example
##D data(france_two_clusters)
##D g3<-graphscan_nd(data=france_two_clusters)
##D g3<-cluster(g3)
##D graphscan_plot(g3,map=france)
## End(Not run)



