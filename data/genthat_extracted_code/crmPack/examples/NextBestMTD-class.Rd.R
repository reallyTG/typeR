library(crmPack)


### Name: NextBestMTD-class
### Title: The class with the input for finding the next best MTD estimate
### Aliases: NextBestMTD-class .NextBestMTD
### Keywords: classes

### ** Examples


# In the example below the MTD is defined as the dose for which prob(DLE)=0.33 and
# we will use the 25th quantile of the posterior of MTD as our next best dose.
mtdNextBest <- NextBestMTD(target=0.33,
                           derive=
                             function(mtdSamples){
                               quantile(mtdSamples, probs=0.25)
                             })





