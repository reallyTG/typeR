library(SixSigma)


### Name: plotControlProfiles
### Title: Profiles control plot
### Aliases: plotControlProfiles

### ** Examples

wby.phase1 <- ss.data.wby[, 1:35]
wb.limits <- climProfiles(profiles = wby.phase1,
    x = ss.data.wbx,
    smoothprof = TRUE,
    smoothlim = TRUE)
wby.phase2 <- ss.data.wby[, 36:50]
wb.out.phase2 <- outProfiles(profiles = wby.phase2,
    x = ss.data.wbx,
    cLimits = wb.limits,
    tol = 0.8)
plotControlProfiles(wb.out.phase2$pOut, tol = 0.8)



