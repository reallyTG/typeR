library(BIOdry)


### Name: plot.muleMan
### Title: Plot muleMan objects
### Aliases: plot.muleMan

### ** Examples

##TRW chronology (mm) and inside-bark radii
data(Pchron,envir = environment())
data(Pradii03,envir = environment())
## TRW fluctuations:
trwf <- modelFrame(Pchron,
                   sc.c = Pradii03,
                   rf.t = 2003,
                   log.t = TRUE)
## Climatic records:
data(Temp,envir = environment())
data(Prec,envir = environment())
## Aridity-index fluctuations:
aif <- modelFrame(rd = list(Prec, Temp),
                  fn = list('moveYr','wlai'),
                  lv = list('year','year'),
                  form = 'lmeForm')

##Multivariate comparison:
mcomp <- muleMan(trwf,
                    aif,
                    nperm = 10^3)

plot(mcomp, grid = FALSE)    



