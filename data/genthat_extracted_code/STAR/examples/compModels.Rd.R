library(STAR)


### Name: compModels
### Title: Compare Duration Models on a Specific Data Set
### Aliases: compModels
### Keywords: distribution ts

### ** Examples

## Not run: 
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
##D ## It does not look too bad so let fit simple models
##D compModels(CAL1S[["neuron 1"]])
##D 
##D ## Simulate a sample with 100 events from an inverse Gaussian
##D set.seed(1102006,"Mersenne-Twister")
##D mu.true <- 0.075
##D sigma2.true <- 3
##D sampleSize <- 100
##D sampIG <- rinvgauss(sampleSize,mu=mu.true,sigma2=sigma2.true)
##D 
##D ## Compare models and display QQ plot
##D compModels(sampIG,type="qq")
##D 
##D ## Compare models and display survival plot
##D compModels(sampIG,type="s")
##D 
##D 
##D ## Generate a censored sample using an exponential distribution
##D sampEXP <- rexp(sampleSize,1/(2*mu.true))
##D sampIGtime <- pmin(sampIG,sampEXP)
##D sampIGstatus <- as.numeric(sampIG <= sampEXP)
##D ## Compare models and display QQ plot
##D ## WARNING with censored data like here the QQ plot is misleading
##D compModels(yi=sampIGtime,si=sampIGstatus,type="qq")
##D ## Compare models and display survival plot
##D compModels(yi=sampIGtime,si=sampIGstatus,type="s")
## End(Not run)



