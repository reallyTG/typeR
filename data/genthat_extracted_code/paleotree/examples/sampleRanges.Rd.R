library(paleotree)


### Name: sampleRanges
### Title: Sampling Taxon Ranges
### Aliases: sampleRanges

### ** Examples


set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
layout(1:2)
#let's see what the 'true' diversity curve looks like in this case
taxicDivCont(taxa)
#simulate a fossil record with imperfect sampling with sampleRanges
rangesCont <- sampleRanges(taxa,r = 0.5)
#plot the diversity curve based on the sampled ranges
taxicDivCont(rangesCont)
#compare the true history to what we might observe!

#let's try more complicated models!

#a pull-to-the-recent model with x5 increase over time similar to Liow et al.'s  incP
layout(1:2)
rangesCont1 <- sampleRanges(taxa,r = 0.5,rTimeRatio = 5,plot = TRUE)
taxicDivCont(rangesCont1)

#a hat-shaped model
layout(1:2)
rangesCont1 <- sampleRanges(taxa,r = 0.5,alpha = 4,beta = 4,plot = TRUE)
taxicDivCont(rangesCont1)

#a combination of these
layout(1:2)
rangesCont1 <- sampleRanges(taxa,r = 0.5,alpha = 4,beta = 4,rTimeRatio = 5,plot = TRUE)
taxicDivCont(rangesCont1)

#testing with cryptic speciation
layout(1)
recordCrypt <- simFossilRecord(p = 0.1, q = 0.1, prop.cryptic = 0.5, nruns = 1,
nTotalTaxa = c(20,30), nExtant = 0)
taxaCrypt <- fossilRecord2fossilTaxa(recordCrypt)
rangesCrypt <- sampleRanges(taxaCrypt,r = 0.5)
taxicDivCont(rangesCrypt)

#an example of hat-shaped models (beta distributions) when there are live taxa
set.seed(444)
recordLive <- simFossilRecord(p = 0.1, q = 0.05, nruns = 1,
nTotalTaxa = c(5,100),nExtant = c(10,100))
taxaLive <- fossilRecord2fossilTaxa(recordLive)
#with end-points of live taxa at random points in the hat
rangesLive <- sampleRanges(taxaLive,r = 0.1,alpha = 4,beta = 4,randLiveHat = TRUE,plot = TRUE)
#with all taxa end-points at end-point of hat
rangesLive <- sampleRanges(taxaLive,r = 0.1,alpha = 4,beta = 4,randLiveHat = FALSE,plot = TRUE)


## No test: 
#simulate a model where sampling rate evolves under brownian motion
tree <- taxa2phylo(taxa,obs = taxa[,3])
sampRateBM <- rTraitCont(tree)
sampRateBM <- sampRateBM-min(sampRateBM)
layout(1:2)
rangesCont1 <- sampleRanges(taxa,r = sampRateBM,plot = TRUE)
taxicDivCont(rangesCont1)

#evolving sampling rate, hat model and pull of the recent
layout(1:2)
rangesCont1 <- sampleRanges(taxa,r = sampRateBM,alpha = 4,beta = 4,rTimeRatio = 5,plot = TRUE)
taxicDivCont(rangesCont1)
layout(1)

#the simpler model is simulated by pulling waiting times from an exponential
#more complicated models are simulated by discretizing time into small intervals
#are these two methods comparable?
#let's look at the number of taxa sampled under both methods
summary(replicate(100,sum(!is.na(sampleRanges(taxa,r = 0.5,alt.method = FALSE)[,1]))))
summary(replicate(100,sum(!is.na(sampleRanges(taxa,r = 0.5,alt.method = TRUE)[,1]))))
#they look pretty similar!
## End(No test)




