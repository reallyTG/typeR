library(BIOdry)


### Name: modelFrame
### Title: Dendroclimatic-fluctuations modeling
### Aliases: modelFrame

### ** Examples

    ##TRW chronology (mm) and inside-bark radii
data(Pchron,envir = environment())
data(Pradii03,envir = environment())
## Tree-ring width fluctuations:
trwf <- modelFrame(Pchron,
                   sc.c = Pradii03,
                   rf.t = 2003,
                   log.t = TRUE)
summary(trwf$'model')

## Tree-diameter fluctuations:
tdf <- modelFrame(Pchron,
                   sc.c = Pradii03,
                   rf.t = 2003,
                  log.t = TRUE,
                  MoreArgs = list(mp = c(pi,2)))

summary(tdf$'model')


## Climatic records:
data(Temp,envir = environment())
data(Prec,envir = environment())
## Aridity-index fluctuations:
aif <- modelFrame(rd = list(Prec, Temp),
                  fn = list('moveYr','wlai'),
                  lv = list('year','year'),
                  form = 'lmeForm')
summary(aif$'model')



