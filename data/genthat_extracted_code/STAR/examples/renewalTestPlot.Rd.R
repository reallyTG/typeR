library(STAR)


### Name: renewalTestPlot
### Title: Non-Parametric Tests for Renewal Processes
### Aliases: renewalTestPlot
### Keywords: ts survival

### ** Examples

## Not run: 
##D ## Apply the test of Ogata (1988) shallow shock data
##D data(ShallowShocks)
##D renewalTestPlot(ShallowShocks$Date,d=3)
##D 
##D ## Apply the test to the second and third neurons of the cockroachAlSpont
##D ## data set
##D ## load spontaneous data of 4 putative projection neurons
##D ## simultaneously recorded from the cockroach (Periplaneta
##D ## americana) antennal lobe
##D data(CAL1S)
##D ## convert data into spikeTrain objects
##D CAL1S <- lapply(CAL1S,as.spikeTrain)
##D ## look at the individual trains
##D ## first the "raw" data
##D CAL1S[["neuron 1"]]
##D ## next some summary information
##D summary(CAL1S[["neuron 1"]])
##D ## next the renewal tests
##D renewalTestPlot(CAL1S[["neuron 1"]])
##D 
##D ## Simulate a renewal log normal train with 500 isi
##D isi.nb <- 500
##D train1 <- c(cumsum(rlnorm(isi.nb+1,log(0.01),0.25)))
##D ## make the test
##D renewalTestPlot(train1)
##D 
##D ## Simulate a (non renewal) 2 states train
##D myTransition <- matrix(c(0.9,0.1,0.1,0.9),2,2,byrow=TRUE)
##D states2 <- numeric(isi.nb+1) + 1
##D for (i in 1:isi.nb) states2[i+1] <- rbinom(1,1,prob=1-myTransition[states2[i],])+1
##D myLnormPara2 <- matrix(c(log(0.01),0.25,log(0.05),0.25),2,2,byrow=TRUE)
##D train2 <-
##D cumsum(rlnorm(isi.nb+1,myLnormPara2[states2,1],myLnormPara2[states2,2]))
##D ## make the test
##D renewalTestPlot(train2)
## End(Not run)



