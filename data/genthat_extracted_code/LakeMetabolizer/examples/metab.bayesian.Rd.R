library(LakeMetabolizer)


### Name: metab.bayesian
### Title: Metabolism model based on a bayesian parameter estimation
###   framework
### Aliases: metab.bayesian

### ** Examples

## Not run: 
##D library(rLakeAnalyzer)
##D 
##D doobs = load.ts(system.file('extdata', 
##D                            'sparkling.doobs', package="LakeMetabolizer"))
##D wtr = load.ts(system.file('extdata', 
##D                          'sparkling.wtr', package="LakeMetabolizer"))
##D wnd = load.ts(system.file('extdata', 
##D                          'sparkling.wnd', package="LakeMetabolizer"))
##D irr = load.ts(system.file('extdata', 
##D                          'sparkling.par', package="LakeMetabolizer"))
##D 
##D #Subset a day
##D mod.date = as.POSIXct('2009-07-08', 'GMT')
##D doobs = doobs[trunc(doobs$datetime, 'day') == mod.date, ]
##D wtr = wtr[trunc(wtr$datetime, 'day') == mod.date, ]
##D wnd = wnd[trunc(wnd$datetime, 'day') == mod.date, ]
##D irr = irr[trunc(irr$datetime, 'day') == mod.date, ]
##D 
##D k600 = k.cole.base(wnd[,2])
##D k.gas = k600.2.kGAS.base(k600, wtr[,3], 'O2')
##D do.sat = o2.at.sat(wtr[,1:2], altitude=300)
##D 
##D metab.bayesian(irr=irr[,2], z.mix=rep(1, length(k.gas)), 
##D               do.sat=do.sat[,2], wtr=wtr[,2],
##D               k.gas=k.gas, do.obs=doobs[,2])
## End(Not run)



