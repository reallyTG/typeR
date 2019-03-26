library(saasCNV)


### Name: genome.wide.plot
### Title: Visualize Genome-Wide SCNA Profile
### Aliases: genome.wide.plot
### Keywords: SCNA visualization diagnosis

### ** Examples

data(seq.data)
data(seq.cnv)

genome.wide.plot(data=seq.data, segs=seq.cnv, 
                 sample.id="PT116", 
                 chrs=sub("^chr","",unique(seq.cnv$chr)), 
                 cex=0.3)



