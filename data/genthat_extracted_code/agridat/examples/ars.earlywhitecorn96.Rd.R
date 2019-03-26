library(agridat)


### Name: ars.earlywhitecorn96
### Title: Multi-environment trial of early white food corn
### Aliases: ars.earlywhitecorn96
### Keywords: datasets

### ** Examples


data(ars.earlywhitecorn96)
dat <- ars.earlywhitecorn96

require(lattice)
# These views emphasize differences between locations
dotplot(gen~yield, dat, group=loc, auto.key=list(columns=3),
        main="ars.earlywhitecorn96")
## dotplot(gen~stalklodge, dat, group=loc, auto.key=list(columns=3),
##         main="ars.earlywhitecorn96")
splom(~dat[,3:9], group=dat$loc, auto.key=list(columns=3),
      main="ars.earlywhitecorn96")

# MANOVA
m1 <- manova(cbind(yield,earht,moisture) ~ gen + loc, dat)
m1
summary(m1)




