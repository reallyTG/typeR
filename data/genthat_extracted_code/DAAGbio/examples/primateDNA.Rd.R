library(DAAGbio)


### Name: primateDNA
### Title: Mitochondrial DNA sequence data from 14 primates
### Aliases: primateDNA
### Keywords: datasets

### ** Examples

data(primateDNA)
## Not run: 
##D library(ape)
##D primates.dist <- dist.dna(as.DNAbin(primateDNA), model = "K80") 
##D primates.cmd <- cmdscale(primates.dist)
##D lefrt <- primates.cmd[,1] < apply(primates.cmd, 1, mean)
##D plot(primates.cmd)
##D text(primates.cmd, rownames(primates.cmd), pos=lefrt*2+2)
## End(Not run)



