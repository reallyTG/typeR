library(SMC)


### Name: auxiliaryParticleFilter
### Title: The auxiliary particle filtering algorithm
### Aliases: auxiliaryParticleFilter
### Keywords: methods

### ** Examples

MSObj  <- MarkovSwitchingFuncGenerator(-2468)
smcObj <-
    with(MSObj,
     {
         auxiliaryParticleFilter(nStreams                = 5000,
                                 nPeriods                = nrow(yy),
                                 dimPerPeriod            = ncol(yy),
                                 generateStreamRepsFunc  = generateStreamRepsFunc,
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

MSObj  <- MarkovSwitchingFuncGenerator(-8642)
smcObj <-
    with(MSObj,
     {
         auxiliaryParticleFilter(nStreams                = 5000,
                                 nPeriods                = nrow(yy),
                                 dimPerPeriod            = ncol(yy),
                                 generateStreamRepsFunc  = generateStreamRepsFunc,
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



