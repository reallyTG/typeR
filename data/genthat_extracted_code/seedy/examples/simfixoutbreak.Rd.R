library(seedy)


### Name: simfixoutbreak
### Title: Simulate evolutionary dynamics on a given transmission tree
### Aliases: simfixoutbreak

### ** Examples


# Simulate a transmission chain
inf.times <- (0:20)*100
rec.times <- inf.times + 100 + rpois(21,50)
inf.source <- 0:20
inf.source[c(3,11)] <- 0 # Two importations
mut.rate <- 0.001

# Now simulate evolutionary dynamics and samples on top of this tree
W <- simfixoutbreak(ID=1:21, inf.times, rec.times, inf.source, mut.rate, equi.pop=1000, shape=flat,
                    inoc.size=10, imp.var=25, samples.per.time=5, samp.schedule="random", 
                    samp.freq=500, full=FALSE, feedback=100, glen=100000, 
                    ref.strain=NULL)

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
             blockheight=0.5, hspace=60, label.pos="left", block.col="grey", 
             jitter=0.004, xlab="Time", pch=1) 




