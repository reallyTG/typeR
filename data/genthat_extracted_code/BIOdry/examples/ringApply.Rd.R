library(BIOdry)


### Name: ringApply
### Title: Multilevel apply
### Aliases: ringApply

### ** Examples


##Multilevel ecological data series (MEDS) of tree-ring widths:
data(Prings05,envir = environment())
## Radial increments measured on 2003:
data(Pradii03,envir = environment())    
## MEDS of monthly precipitation sums and average temperatures:
data(PTclim05,envir = environment())

##Tree-level scaling of years of formation
##with 'rtimes' function:
dfm1 <- ringApply(Prings05,
                  lv = 2,
                  fn = 'rtimes')
str(dfm1)
##Relative time-units from year 1 to year 9:
subset(dfm1,time%in%c(1:9,NA))

## Sample-level scaling of TRW chronologies around reference radii
## which were measured at 2003:
dfm2 <- ringApply(dfm1,
                  lv = 'sample',
                  sc.c = Pradii03,
                  rf.t = 2003,
                  fn = 'scacum')
str(dfm2)    
##Sample-level modeling of basal areas (mm2) via allometric
##scaling:
dfm3 <- ringApply(dfm2,
                  lv = 'sample',
                  fn = 'amod',
                  MoreArgs = list(mp = c(2,1,0.25 * pi,2)))
str(dfm3)

## Seasonal years from 'October' to 'September':
cl1 <- ringApply(PTclim05,
                 lv = 'year',
                 fn = 'moveYr')
tail(cl1,15)

##Year-level aridity indexes: 
wl <- ringApply(cl1,
                lv = 'year',
                fn = 'wlai')
str(wl)

## Plot of aridity-index fluctuations:
d <- groupedData(lmeForm(wl),wl)
plot(d)        




