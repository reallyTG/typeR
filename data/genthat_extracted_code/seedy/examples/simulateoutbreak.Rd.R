library(seedy)


### Name: simulateoutbreak
### Title: Simulate transmission and evolutionary dynamics
### Aliases: simulateoutbreak

### ** Examples


W <- simulateoutbreak(init.sus=10, inf.rate=0.002, rem.rate=0.001, mut.rate=0.0001, 
                      equi.pop=2000, inoc.size=1, samples.per.time=10, 
                      samp.schedule="calendar", samp.freq=500, mincases=3) 
sampledata <- W$sampledata
epidata <- W$epidata

# Calculate distance matrix for observed samples
distmat <- gd(sampledata[,3], W$libr, W$nuc, W$librstrains)

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



