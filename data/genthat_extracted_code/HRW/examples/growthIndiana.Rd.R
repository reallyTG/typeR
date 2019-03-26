library(HRW)


### Name: growthIndiana
### Title: Adolescent somatic growth in Indiana, U.S.A.
### Aliases: growthIndiana

### ** Examples

library(HRW) ; data(growthIndiana)
growthINblackMales <- growthIndiana[(growthIndiana$male == 1) & (growthIndiana$black == 1),]
if (require("lattice"))
   xyplot(height ~ age|factor(idnum),data = growthINblackMales)



