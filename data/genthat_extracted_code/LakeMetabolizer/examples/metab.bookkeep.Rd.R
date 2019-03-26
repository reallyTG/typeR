library(LakeMetabolizer)


### Name: metab.bookkeep
### Title: Metabolism model based on simple day/night summation
###   NEP-interpreted changes in DO.
### Aliases: metab.bookkeep

### ** Examples

library(rLakeAnalyzer)
Sys.setenv(TZ='GMT')

doobs = load.ts(system.file('extdata', 
                           'sparkling.doobs', package="LakeMetabolizer"))
wtr = load.ts(system.file('extdata', 
                         'sparkling.wtr', package="LakeMetabolizer"))
wnd = load.ts(system.file('extdata', 
                         'sparkling.wnd', package="LakeMetabolizer"))

#Subset a day
mod.date = as.POSIXct('2009-07-08', 'GMT')
doobs = doobs[trunc(doobs$datetime, 'day') == mod.date, ]
wtr = wtr[trunc(wtr$datetime, 'day') == mod.date, ]
wnd = wnd[trunc(wnd$datetime, 'day') == mod.date, ]

k.gas = k600.2.kGAS.base(k.cole.base(wnd[,2]), wtr[,3], 'O2')
do.sat = o2.at.sat.base(wtr[,3], altitude=300)

# Must supply 1 for daytime timesteps and 0 for nighttime timesteps
irr = as.integer(is.day(doobs[,1], 45))

metab.bookkeep(doobs[,2], do.sat, k.gas, z.mix=1, irr, datetime=doobs$datetime)



