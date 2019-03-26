library(BIOdry)


### Name: frametoLme
### Title: LME modeling
### Aliases: frametoLme

### ** Examples


##Multilevel data frame of tree-ring widths:
data(Prings05,envir = environment())
## Radial increments measured on 2003:
data(Pradii03,envir = environment())    
## Monthly precipitation sums and average temperatures:
data(PTclim05,envir = environment())

##Modeling TRW fluctuations:
mpin <- modelFrame(Prings05,
                   sc.c = Pradii03,
                   rf.t = 2003)

## Detrending the TRW fluctuations by fitting a (l)td-form model
## with Maximum-likelihood method (ML):
pdata <- mpin$'model'$'data'
rlme <- frametoLme(pdata,
                   form = 'tdForm',
                   method = 'ML',
                   log.t = TRUE)
summary(rlme$model)

##a plot of the modeled fluctuations
d <- groupedData(lmeForm(rlme$fluc,lev.rm = 1),data = rlme$fluc)
plot(d,groups = ~ sample,auto.key = TRUE)

## A model of aridity: 
cf <- modelFrame(PTclim05,
                 lv = list('year','year'),
                 fn = list('moveYr','wlai'),
                 form = NULL)
summary(cf)

## An lme model of aridity at 'plot' level:
cdata <- cf$'model'$'data'
rmod <- frametoLme(cdata,form = 'lmeForm')
summary(rmod$model)

rk <- groupedData(lmeForm(rmod$fluc),data=rmod$fluc)
plot(rk,ylab = 'detrended AI')



