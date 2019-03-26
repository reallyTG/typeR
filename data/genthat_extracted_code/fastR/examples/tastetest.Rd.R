library(fastR)


### Name: tastetest
### Title: Taste test data
### Aliases: tastetest taste1
### Keywords: datasets

### ** Examples


data(tastetest)
data(taste1)
require(Hmisc)
xyplot(score~scr, data=tastetest)
xyplot(score~scr, groups=liq, tastetest, type='a')
favstats(score~scr, data=tastetest)




