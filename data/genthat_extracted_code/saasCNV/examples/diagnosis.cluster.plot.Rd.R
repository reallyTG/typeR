library(saasCNV)


### Name: diagnosis.cluster.plot
### Title: Visualize Genome-Wide SCNA Profile in 2D Cluster Plot
### Aliases: diagnosis.cluster.plot
### Keywords: SCNA cluster visualization diagnosis

### ** Examples

data(seq.data)
data(seq.cnv)

diagnosis.cluster.plot(segs=seq.cnv, 
                       chrs=sub("^chr","",unique(seq.cnv$chr)), 
                       min.snps=10, max.cex=3, ref.num.probe=1000)



