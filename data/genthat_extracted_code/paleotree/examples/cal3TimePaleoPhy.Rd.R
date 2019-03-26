library(paleotree)


### Name: cal3TimePaleoPhy
### Title: Three Rate Calibrated 'a posteriori' Time-Scaling of
###   Paleo-Phylogenies
### Aliases: cal3TimePaleoPhy bin_cal3TimePaleoPhy cal3
###   bin_cal3TimePaleoPhy

### ** Examples


#Simulate some fossil ranges with simFossilRecord
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
#simulate a fossil record with imperfect sampling with sampleRanges
rangesCont <- sampleRanges(taxa,r = 0.5)
#let's use taxa2cladogram to get the 'ideal' cladogram of the taxa
cladogram <- taxa2cladogram(taxa,plot = TRUE)
#this library allows one to use rate calibrated type time-scaling methods (Bapst, in prep.)
#to use these, we need an estimate of the sampling rate (we set it to 0.5 above)
likFun <- make_durationFreqCont(rangesCont)
srRes <- optim(parInit(likFun),likFun,lower = parLower(likFun),upper = parUpper(likFun),
      method = "L-BFGS-B",control = list(maxit = 1000000))
sRate <- srRes[[1]][2]
# we also need extinction rate and branching rate
   # we can get extRate from getSampRateCont too
#we'll assume extRate = brRate (ala Foote et al., 1999); may not always be a good assumption
divRate <- srRes[[1]][1]
#now let's try cal3TimePaleoPhy, which time-scales using a sampling rate to calibrate
#This can also resolve polytomies based on sampling rates, with some stochastic decisions
ttree <- cal3TimePaleoPhy(cladogram,rangesCont,brRate = divRate,extRate = divRate,
    sampRate = sRate,ntrees = 1,plot = TRUE)
#notice the warning it gives!
phyloDiv(ttree)

#by default, cal3TimePaleoPhy may predict indirect ancestor-descendant relationships
#can turn this off by setting anc.wt = 0
ttree <- cal3TimePaleoPhy(cladogram,rangesCont,brRate = divRate,extRate = divRate,
    sampRate = sRate,ntrees = 1,anc.wt = 0,plot = TRUE)

## No test: 
#let's look at how three trees generated with very different time of obs. look
ttreeFAD <- cal3TimePaleoPhy(cladogram,rangesCont,brRate = divRate,extRate = divRate,
    FAD.only = TRUE,dateTreatment = "firstLast",sampRate = sRate,ntrees = 1,plot = TRUE)
ttreeRand <- cal3TimePaleoPhy(cladogram,rangesCont,brRate = divRate,extRate = divRate,
    FAD.only = FALSE,dateTreatment = "randObs",sampRate = sRate,ntrees = 1,plot = TRUE)
#by default the time of observations are the LADs
ttreeLAD <- cal3TimePaleoPhy(cladogram,rangesCont,brRate = divRate,extRate = divRate,
    FAD.only = FALSE,dateTreatment = "randObs",sampRate = sRate,ntrees = 1,plot = TRUE)
layout(1:3)
parOrig <- par(no.readonly = TRUE)
par(mar = c(0,0,0,0))
plot(ladderize(ttreeFAD));text(5,5,"time.obs = FAD",cex = 1.5,pos = 4)
plot(ladderize(ttreeRand));text(5,5,"time.obs = Random",cex = 1.5,pos = 4)
plot(ladderize(ttreeLAD));text(5,5,"time.obs = LAD",cex = 1.5,pos = 4)
layout(1); par(parOrig)

#to get a fair sample of trees, let's increase ntrees
ttrees <- cal3TimePaleoPhy(cladogram,rangesCont,brRate = divRate,extRate = divRate,
    sampRate = sRate,ntrees = 9,plot = FALSE)
#let's compare nine of them at once in a plot
layout(matrix(1:9,3,3))
parOrig <- par(no.readonly = TRUE)
par(mar = c(0,0,0,0))
for(i in 1:9){plot(ladderize(ttrees[[i]]),show.tip.label = FALSE)}
layout(1)
par(parOrig)
#they are all a bit different!

#can plot the median diversity curve with multiDiv
multiDiv(ttrees)

#using node.mins
#let's say we have (molecular??) evidence that node #5 is at least 1200 time-units ago
#to use node.mins, first need to drop any unshared taxa
droppers <- cladogram$tip.label[is.na(
      match(cladogram$tip.label,names(which(!is.na(rangesCont[,1])))))]
cladoDrop <- drop.tip(cladogram, droppers)
# now make vector same length as number of nodes
nodeDates <- rep(NA, Nnode(cladoDrop))
nodeDates[5] <- 1200
ttree <- cal3TimePaleoPhy(cladoDrop,rangesCont,brRate = divRate,extRate = divRate,
    sampRate = sRate,ntrees = 1,node.mins = nodeDates,plot = TRUE)

#example with time in discrete intervals
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
#simulate a fossil record with imperfect sampling with sampleRanges()
rangesCont <- sampleRanges(taxa,r = 0.5)
#let's use taxa2cladogram to get the 'ideal' cladogram of the taxa
cladogram <- taxa2cladogram(taxa,plot = TRUE)
#Now let's use binTimeData to bin in intervals of 1 time unit
rangesDisc <- binTimeData(rangesCont,int.length = 1)
#we can do something very similar for the discrete time data (can be a bit slow)
likFun <- make_durationFreqDisc(rangesDisc)
spRes <- optim(parInit(likFun),likFun,lower = parLower(likFun),upper = parUpper(likFun),
      method = "L-BFGS-B",control = list(maxit = 1000000))
sProb <- spRes[[1]][2]
#but that's the sampling PROBABILITY per bin, not the instantaneous rate of change
#we can use sProb2sRate() to get the rate. We'll need to also tell it the int.length
sRate1 <- sProb2sRate(sProb,int.length = 1)
#we also need extinction rate and branching rate (see above)
    #need to divide by int.length...
divRate <- spRes[[1]][1]/1
#estimates that r = 0.3... kind of low (simulated sampling rate is 0.5)
#Note: for real data, you may need to use an average int.length (no constant length)
ttree <- bin_cal3TimePaleoPhy(cladogram,rangesDisc,brRate = divRate,extRate = divRate,
    sampRate = sRate1,ntrees = 1,plot = TRUE)
phyloDiv(ttree)
#can also force the appearance timings not to be chosen stochastically
ttree1 <- bin_cal3TimePaleoPhy(cladogram,rangesDisc,brRate = divRate,extRate = divRate,
    sampRate = sRate1,ntrees = 1,nonstoch.bin = TRUE,plot = TRUE)
phyloDiv(ttree1)

# testing node.mins in bin_cal3TimePaleoPhy
ttree <- bin_cal3TimePaleoPhy(cladoDrop,rangesDisc,brRate = divRate,extRate = divRate,
    sampRate = sRate1,ntrees = 1,node.mins = nodeDates,plot = TRUE)
# with randres = TRUE
ttree <- bin_cal3TimePaleoPhy(cladoDrop,rangesDisc,brRate = divRate,extRate = divRate,
    sampRate = sRate1,ntrees = 1,randres = TRUE,node.mins = nodeDates,plot = TRUE)


#example with multiple values of anc.wt
ancWt <- sample(0:1,nrow(rangesDisc[[2]]),replace = TRUE)
names(ancWt) <- rownames(rangesDisc[[2]])
ttree1 <- bin_cal3TimePaleoPhy(cladogram,rangesDisc,brRate = divRate,extRate = divRate,
    sampRate = sRate1,ntrees = 1,anc.wt = ancWt,plot = TRUE)
## End(No test)




