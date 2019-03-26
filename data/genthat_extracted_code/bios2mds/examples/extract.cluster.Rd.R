library(bios2mds)


### Name: extract.cluster
### Title: Extraction of clusters alignments
### Aliases: extract.cluster
### Keywords: extraction

### ** Examples

# Clustering human GPCRs in 4 groups with 100 runs of K-means 
# and extraction of the alignment of each cluster
aln <- import.fasta(system.file("msa/human_gpcr.fa", package = "bios2mds"))
data(gpcr)
kmeans <- kmeans.run(gpcr$mmds$sapiens.active$coord, nb.clus = 4, nb.run = 100)
clusAlign <- extract.cluster(kmeans,aln)




