library(paleotree)


### Name: freqRat
### Title: Frequency Ratio Method for Estimating Sampling Probability
### Aliases: freqRat

### ** Examples


#Simulate some fossil ranges with simFossilRecord
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
#simulate a fossil record with imperfect sampling with sampleRanges
rangesCont <- sampleRanges(taxa,r = 0.1)
#Now let's use binTimeData to bin in intervals of 5 time units
rangesDisc <- binTimeData(rangesCont,int.length = 5)

#now, get an estimate of the sampling rate (we set it to 0.5 above)
#for discrete data we can estimate the sampling probability per interval (R)
    #i.e. this is not the same thing as the instantaneous sampling rate (r)
#can use sRate2sProb to see what we would expect
sRate2sProb(r = 0.1,int.length = 5)
#expect R = ~0.39

#now we can apply freqRat to get sampling probability
SampProb <- freqRat(rangesDisc,plot = TRUE)
SampProb

#est. R = ~0.25 
#Not wildly accurate, is it?

#can also calculate extinction rate per interval of time
freqRat(rangesDisc,calcExtinction = TRUE)

#est. ext rate = ~0.44 per interval
#5 time-unit intervals, so ~0.44 / 5 = ~0.08 per time-unite
#That's pretty close to the generating value of 0.01, used in sampleRanges

## Not run: 
##D #################
##D #The following example code (which is not run by default) examines how 
##D 	#the freqRat estimates vary with sample size, interval length
##D 	#and compare it to using make_durationFreqDisc
##D 
##D #how good is the freqRat at 20 sampled taxa on avg?
##D set.seed(444)
##D r <- runif(100)
##D int.length = 1
##D R <- sapply(r,sRate2sProb,int.length = 1)	#estimate R from r, assuming stuff like p = q
##D ntaxa <- freqRats <- numeric()
##D for(i in 1:length(r)){
##D 	#assuming budding model
##D 	record <- simFossilRecord(p = 0.1, q = 0.1, r = r[i], nruns = 1,
##D 		nSamp = c(15,25), nExtant = 0, plot = TRUE)
##D 	ranges <- fossilRecord2fossilRanges(record)
##D 	timeList <- binTimeData(ranges,int.length = int.length)
##D 	ntaxa[i] <- nrow(timeList[[2]])
##D 	freqRats[i] <- freqRat(timeList)
##D 	}
##D plot(R,freqRats);abline(0,1)
##D #without the gigantic artifacts bigger than 1...
##D plot(R,freqRats,ylim = c(0,1));abline(0,1)
##D #very worrisome lookin'!
##D 
##D #how good is it at 100 sampled taxa on average?
##D set.seed(444)
##D r <- runif(100)
##D int.length = 1
##D R <- sapply(r,sRate2sProb,int.length = 1)
##D ntaxa <- freqRats <- numeric()
##D for(i in 1:length(r)){
##D 	#assuming budding model
##D 	record <- simFossilRecord(p = 0.1, q = 0.1, r = r[i], nruns = 1,
##D 		nSamp = c(80,150), nExtant = 0, plot = TRUE)
##D 	ranges <- fossilRecord2fossilRanges(record)
##D 	timeList <- binTimeData(ranges,int.length = int.length)
##D 	ntaxa[i] <- nrow(timeList[[2]])
##D 	freqRats[i] <- freqRat(timeList)
##D 	}
##D plot(R,freqRats,ylim = c(0,1));abline(0,1)
##D #not so hot, eh?
##D 
##D ################
##D #LETS CHANGE THE TIME BIN LENGTH!
##D 
##D #how good is it at 100 sampled taxa on average, with longer time bins?
##D set.seed(444)
##D r <- runif(100)
##D int.length <- 10
##D R <- sapply(r,sRate2sProb,int.length = int.length)
##D ntaxa <- freqRats <- numeric()
##D for(i in 1:length(r)){
##D 	#assuming budding model
##D 	record <- simFossilRecord(p = 0.1, q = 0.1, r = r[i], nruns = 1,
##D 		nSamp = c(80,150), nExtant = 0, plot = TRUE)
##D 	ranges <- fossilRecord2fossilRanges(record)
##D 	timeList <- binTimeData(ranges,int.length = int.length)
##D 	ntaxa[i] <- nrow(timeList[[2]])
##D 	freqRats[i] <- freqRat(timeList)
##D 	}
##D plot(R,freqRats,ylim = c(0,1));abline(0,1)
##D #things get more accurate as interval length increases... odd, eh?
##D 
##D #how good is it at 20 sampled taxa on average, with longer time bins?
##D set.seed(444)
##D r <- runif(100)
##D int.length <- 10
##D R <- sapply(r,sRate2sProb,int.length = int.length)
##D ntaxa <- freqRats <- numeric()
##D for(i in 1:length(r)){
##D 	#assuming budding model
##D 	record <- simFossilRecord(p = 0.1, q = 0.1, r = r[i], nruns = 1,
##D 		nSamp = c(15,25), nExtant = 0, plot = TRUE)
##D 	ranges <- fossilRecord2fossilRanges(record)
##D 	timeList <- binTimeData(ranges,int.length = int.length)
##D 	ntaxa[i] <- nrow(timeList[[2]])
##D 	freqRats[i] <- freqRat(timeList)
##D 	}
##D plot(R,freqRats,ylim = c(0,1));abline(0,1)
##D #still not so hot at low sample sizes, even with longer bins
##D 
##D ########################
##D #ML METHOD
##D 
##D #how good is the ML method at 20 taxa, 1 time-unit bins?
##D set.seed(444)
##D r <- runif(100)
##D int.length <- 1
##D R <- sapply(r,sRate2sProb,int.length = int.length)
##D ntaxa <- ML_sampProb <- numeric()
##D for(i in 1:length(r)){
##D 	#assuming budding model
##D 	record <- simFossilRecord(p = 0.1, q = 0.1, r = r[i], nruns = 1,
##D 		nSamp = c(15,25), nExtant = 0, plot = TRUE)
##D 	ranges <- fossilRecord2fossilRanges(record)
##D 	timeList <- binTimeData(ranges,int.length = int.length)
##D 	ntaxa[i] <- nrow(timeList[[2]])
##D  likFun <- make_durationFreqDisc(timeList)
##D  ML_sampProb[i] <- optim(parInit(likFun),likFun,
##D 		lower = parLower(likFun),upper = parUpper(likFun),
##D      method = "L-BFGS-B",control = list(maxit = 1000000))[[1]][2]
##D 	}
##D plot(R,ML_sampProb);abline(0,1)
##D # Not so great due to likelihood surface ridges
##D  # but it returns values between 0-1
##D 
##D #how good is the ML method at 100 taxa, 1 time-unit bins?
##D set.seed(444)
##D r <- runif(100)
##D int.length <- 1
##D R <- sapply(r,sRate2sProb,int.length = int.length)
##D ntaxa <- ML_sampProb <- numeric()
##D for(i in 1:length(r)){
##D 	#assuming budding model
##D 	record <- simFossilRecord(p = 0.1, q = 0.1, r = r[i], nruns = 1,
##D 		nSamp = c(80,150), nExtant = 0, plot = TRUE)
##D 	ranges <- fossilRecord2fossilRanges(record)
##D 	timeList <- binTimeData(ranges,int.length = int.length)
##D 	ntaxa[i] <- nrow(timeList[[2]])
##D  likFun <- make_durationFreqDisc(timeList)
##D  ML_sampProb[i] <- optim(parInit(likFun),likFun,
##D 		lower = parLower(likFun),upper = parUpper(likFun),
##D      method = "L-BFGS-B",control = list(maxit = 1000000))[[1]][2]
##D 	}
##D plot(R,ML_sampProb);abline(0,1)
##D #Oh, fairly nice, although still a biased uptick as R gets larger
##D 
## End(Not run)




