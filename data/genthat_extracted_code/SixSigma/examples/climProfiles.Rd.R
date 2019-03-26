library(SixSigma)


### Name: climProfiles
### Title: Compute profiles limits
### Aliases: climProfiles

### ** Examples

wby.phase1 <- ss.data.wby[, 1:35]
wb.limits <- climProfiles(profiles = wby.phase1,
    x = ss.data.wbx,
    smoothprof = FALSE,
    smoothlim = FALSE)
    plotProfiles(profiles = wby.phase1,
                 x = ss.data.wbx, 
                 cLimits = wb.limits)



