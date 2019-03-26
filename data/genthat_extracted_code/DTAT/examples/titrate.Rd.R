library(DTAT)


### Name: titrate
### Title: Perform neutrophil-guided dose titration of a chemotherapy drug.
### Aliases: titrate

### ** Examples

## No test: 
# Reproduce Figure 5 from the F1000Research paper (run time > 10 s).
# 1. Set up sim$pop & sim$pkpd by running the repro for Figures 1 & 3:
example(topic="Onoue.Friberg", package="DTAT", ask=FALSE)
# 2. Do the neutrophil-nadir-guided dose titration:
chemo <- titrate(doserange = c(50, 3000),
                 dta=newton.raphson(dose1 = 50,
                                    omega = 0.75,
                                    slope1 = -2.0,
                                    slopeU = -0.2)
                 )
library(latticeExtra)
newton <- chemo$course
new.ts <- chemo$anc.ts
anc.tics <- c(200,500,1500,4000,10000)
right <- xYplot(ANC ~ time | id, data=new.ts
                , as.table=TRUE, type="l"
                , layout=c(5,5)
                , scales=list(y=list(log=TRUE, lim=c(100,1.5e4)
                                     , at=anc.tics
                                     , lab=as.character(anc.tics)),
                              x=list(at=seq(0,30,3)))
)
newton <- upData(newton
                 , time = 3*(cycle-1)
                 , labels = c(time="Time")
                 , units = c(time="weeks")
                 , print = FALSE)
dose.tics <- c(50, 200, 600, 1500, 3000)
left <- xYplot(scaled.dose ~ time | id, data=newton
               , as.table=TRUE, type='p', pch='+', cex=1.5
               , layout=c(5,5)
               , scales=list(y=list(lim=DTAT:::scaled(c(30,3200))
                                    , at=DTAT:::scaled(dose.tics)
                                    , lab=as.character(dose.tics)),
                             x=list(lim=c(-1,31)
                                    , at=seq(0,30,3)
                                    , lab=c('0','','6','','12','','18','','24','','30')))
)
update(doubleYScale(left, right, add.ylab2=TRUE)
       , par.settings = simpleTheme(col=brewer.pal(4,"PRGn")[c(4,1)])
)
## End(No test)




