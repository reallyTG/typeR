library(dynCorr)


### Name: dynamicCorrelation
### Title: Dynamic Correlation
### Aliases: dynamicCorrelation

### ** Examples


## Example 1: using default smoothing parameters, obtain dynamical
##            correlation estimates for all three pairs of responses,
##            for both original function and the first derivative.
##            Note that in dynCorrData, mininum of maximum obs. time
##            = 120, results should be the same if either points.by
##            = 1 or points.length = 120 is specified.

examp1_by <- dynamicCorrelation(dataFrame = dynCorrData,
                                depVar = c('resp1', 'resp2', 'resp3'),
                                indepVar = 'time',
                                points.by = 1,
                                subjectVar = 'subject',
                                function.choice = c(1,1,0))

examp1_len <- dynamicCorrelation(dataFrame = dynCorrData,
                                 depVar = c('resp1', 'resp2', 'resp3'),
                                 indepVar = 'time',
                                 points.length = 120,
                                 subjectVar = 'subject',
                                 function.choice = c(1,1,0))
examp1_by
examp1_len

## Example 1a: re-run Example 1 using original dataset, but with min.obs
##             set to 200. Range in lengths of follow-up periods between
##             individuals is reduced.

examp1a <- dynamicCorrelation(dataFrame = dynCorrData,
                              depVar = c('resp1', 'resp2', 'resp3'),
                              indepVar = 'time',
                              min.obs = 150,
                              points.by = 1,
                              subjectVar = 'subject',
                              function.choice = c(1,0,0))
examp1a

## Example 2: using default smoothing parameters, obtain dynamical
##            correlation estimates for all three pairs of responses,
##            looking at range of lags between -10 and +10, for original
##            functions only

examp2 <- dynamicCorrelation(dataFrame = dynCorrData,
                             depVar = c('resp1', 'resp2', 'resp3'),
                             indepVar = 'time',
                             points.by = 1,
                             subjectVar = 'subject',
                             function.choice = c(1,0,0),
                             lag.input = seq(-20,20, by=1))
examp2

## note: output includes zero lag correlations, as well as maximum
##       correlation (in absolute value) in max.dynCorr and and its
##       corresponding lag value in max.dynCorrLag

## Example 3: re-rerun example 2, but set up for plotting of specified
##            lagged correlations

examp3 <- dynamicCorrelation(dataFrame = dynCorrData,
                             depVar = c('resp1', 'resp2', 'resp3'),
                             indepVar = 'time',
                             subjectVar = 'subject',
                             points.by = 1,
                             function.choice = c(1,0,0),
                             lag.input = seq(-20,10, by=1),
                             full.lag.output = TRUE)

# conduct plotting, with one panel for each pair of responses considered;
# the ylim adjustment is made here for the different magnitude of the
# correlations between the two pairs

par(mfrow=c(1,2))
plot(seq(-20,10, by=1),
     examp3$lagResultMatrix[[1]][1,],
     type='b',
     xlab = 'lag order (in days)',
     ylab = 'lagged correlations',
     ylim = c(-0.4, -0.2),
     main = 'dyncorr b/t resp1 and resp2 as a function of lag')

abline(v = examp3$max.dynCorrLag[[1]][1,2], lty = 2)

plot(seq(-20,10, by=1),
     examp3$lagResultMatrix[[1]][2,],
     type='b',
     xlab = 'lag order (in days)',
     ylab = 'lagged correlations',
     ylim = c(0.3, 0.5),
     main = 'dyncorr b/t resp1 and resp3 as a function of lag')

abline(v = examp3$max.dynCorrLag[[1]][1,3], lty = 2)

## Example 4: same as the original function piece of Example 1,
##            except now adjust the constant global bandwidth
##            from the default to 40

examp4 <- dynamicCorrelation(dataFrame = dynCorrData,
                             depVar = c('resp1', 'resp2', 'resp3'),
                             indepVar = 'time',
                             points.by = 1,
                             subjectVar = 'subject',
                             function.choice = c(1,0,0),
                             width.range = c(40, 40))
examp4




