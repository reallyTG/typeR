library(HRW)


### Name: BanglaContrac
### Title: Contraception use in Bangladesh
### Aliases: BanglaContrac

### ** Examples

library(HRW) ; data(BanglaContrac)
if (require("lattice"))
   print(xyplot(jitter(usingContraception) ~ ageMinusMean|factor(districtID),
         groups = childCode, data = BanglaContrac))



