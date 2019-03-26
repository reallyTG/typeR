library(LakeMetabolizer)


### Name: metab.ols
### Title: Metabolism model based on a ordinary least squares parameter
###   estimation framework.
### Aliases: metab.ols

### ** Examples

library(rLakeAnalyzer)
doobs = load.ts(system.file('extdata', 
                           'sparkling.doobs', package="LakeMetabolizer"))
wtr = load.ts(system.file('extdata', 
                         'sparkling.wtr', package="LakeMetabolizer"))
wnd = load.ts(system.file('extdata', 
                         'sparkling.wnd', package="LakeMetabolizer"))
irr = load.ts(system.file('extdata', 
                         'sparkling.par', package="LakeMetabolizer"))

#Subset a day
mod.date = as.POSIXct('2009-07-08')
doobs = doobs[trunc(doobs$datetime, 'day') == mod.date, ]
wtr = wtr[trunc(wtr$datetime, 'day') == mod.date, ]
wnd = wnd[trunc(wnd$datetime, 'day') == mod.date, ]
irr = irr[trunc(irr$datetime, 'day') == mod.date, ]
z.mix = ts.thermo.depth(wtr)

k600 = k.cole.base(wnd[,2])
k.gas = k600.2.kGAS.base(k600, wtr[,3], 'O2')
do.sat = o2.at.sat.base(wtr[,3], altitude=300)

metab.ols(doobs[,2], do.sat, k.gas, z.mix[,2], irr[,2], wtr[,3])



