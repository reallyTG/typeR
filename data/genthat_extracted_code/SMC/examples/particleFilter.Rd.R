library(SMC)


### Name: particleFilter
### Title: The particle filtering algorithm
### Aliases: particleFilter
### Keywords: methods

### ** Examples

MSObj  <- MarkovSwitchingFuncGenerator(-13579)
smcObj <-
    with(MSObj,
     {
         particleFilter(nStreams                = 5000,
                        nPeriods                = nrow(yy),
                        dimPerPeriod            = ncol(yy),
                        generateNextStreamsFunc = generateNextStreamsFunc,
                        logObsDensFunc          = logObsDensFunc,
                        returnStreams           = TRUE,
                        returnLogWeights        = TRUE,
                        verboseLevel            = 1)
     })
print(smcObj)
print(names(smcObj))
with(c(smcObj, MSObj),
 {
     par(mfcol = c(2, 1))
     plot(as.ts(yy),
          main     = expression('The data and the underlying regimes'),
          cex.main = 0.8,
          xlab     = 'period',
          ylab     = 'data and the regime means',
          cex.lab  = 0.8)
     lines(as.ts(mu), col = 2, lty = 2)
     plot(as.ts(draws$summary[1, ]),
          main     = expression('The underlying regimes and their estimates'),
          cex.main = 0.8,
          xlab     = 'period',
          ylab     = 'regime means',
          cex.lab  = 0.8)
     lines(as.ts(mu), col = 2, lty = 2)        
 })

MSObj  <- MarkovSwitchingFuncGenerator(-97531)
smcObj <-
    with(MSObj,
     {
         particleFilter(nStreams                = 5000,
                        nPeriods                = nrow(yy),
                        dimPerPeriod            = ncol(yy),
                        generateNextStreamsFunc = generateNextStreamsFunc,
                        logObsDensFunc          = logObsDensFunc,
                        nMHSteps                = 10,
                        returnStreams           = TRUE,
                        returnLogWeights        = TRUE,
                        verboseLevel            = 1)
     })
print(smcObj)
print(names(smcObj))
with(c(smcObj, MSObj),
 {
     par(mfcol = c(2, 1))
     plot(as.ts(yy),
          main     = expression('The data and the underlying regimes'),
          cex.main = 0.8,
          xlab     = 'period',
          ylab     = 'data and the regime means',
          cex.lab  = 0.8)
     lines(as.ts(mu), col = 2, lty = 2)
     plot(as.ts(draws$summary[1, ]),
          main     = expression('The underlying regimes and their estimates'),
          cex.main = 0.8,
          xlab     = 'period',
          ylab     = 'regime means',
          cex.lab  = 0.8)
     lines(as.ts(mu), col = 2, lty = 2)        
 })



