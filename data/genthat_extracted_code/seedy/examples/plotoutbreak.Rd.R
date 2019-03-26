library(seedy)


### Name: plotoutbreak
### Title: Plot outbreak
### Aliases: plotoutbreak

### ** Examples

data(outbreak)
sampledata <- outbreak$sampledata
epidata <- outbreak$epidata

distmat <- gd(sampledata[,3], outbreak$libr, outbreak$nuc, outbreak$librstrains)

# Now pick colors for sampled isolates
colvec <- rainbow(1200)[1:1000] # Color palette
refnode <- 1 # Compare distance to which isolate?
colv <- NULL # Vector of colors for samples
maxD <- max(distmat[,refnode])

for (i in 1:nrow(sampledata)) {
  	colv <- c(colv, 
              colvec[floor((length(colvec)-1)*(distmat[refnode,i])/maxD)+1])
}

plotoutbreak(epidata, sampledata, col=colv, stack=TRUE, arr.len=0.1, 
             blockheight=0.5, hspace=500, label.pos="left", block.col="grey",
             jitter=0.004, xlab="Time", pch=1) 



