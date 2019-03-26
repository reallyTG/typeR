library(LakeMetabolizer)


### Name: metab.kalman
### Title: Metabolism calculated from parameters estimated using a Kalman
###   filter
### Aliases: metab.kalman

### ** Examples

library(rLakeAnalyzer)
doobs <- load.ts(system.file('extdata', 
                            'sparkling.doobs', package="LakeMetabolizer"))
wtr <- load.ts(system.file('extdata', 
                          'sparkling.wtr', package="LakeMetabolizer"))
wnd <- load.ts(system.file('extdata', 
                          'sparkling.wnd', package="LakeMetabolizer"))
irr <- load.ts(system.file('extdata', 
                          'sparkling.par', package="LakeMetabolizer"))

#Subset a day
Sys.setenv(TZ='GMT')
mod.date <- as.POSIXct('2009-07-08', 'GMT')
doobs <- doobs[trunc(doobs$datetime, 'day') == mod.date, ]
wtr <- wtr[trunc(wtr$datetime, 'day') == mod.date, ]
wnd <- wnd[trunc(wnd$datetime, 'day') == mod.date, ]
irr <- irr[trunc(irr$datetime, 'day') == mod.date, ]

k600 <- k.cole.base(wnd[,2])
k.gas <- k600.2.kGAS.base(k600, wtr[,3], 'O2')
do.sat <- o2.at.sat.base(wtr[,3], altitude=300)

metab.kalman(irr=irr[,2], z.mix=rep(1, length(k.gas)), 
            do.sat=do.sat, wtr=wtr[,2],
            k.gas=k.gas, do.obs=doobs[,2])



