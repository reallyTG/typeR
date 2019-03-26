library(BSDA)


### Name: Bypass
### Title: Median charges for coronary bypass at 17 hospitals in North
###   Carolina
### Aliases: Bypass
### Keywords: datasets

### ** Examples


EDA(Bypass$charge)
t.test(Bypass$charge, conf.level=.90)$conf
t.test(Bypass$charge, mu = 35000)




