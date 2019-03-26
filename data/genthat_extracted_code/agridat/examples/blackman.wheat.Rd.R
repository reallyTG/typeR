library(agridat)


### Name: blackman.wheat
### Title: Multi-environment trial of conventional and semi-dwarf wheat
###   varieties
### Aliases: blackman.wheat
### Keywords: datasets

### ** Examples


data(blackman.wheat)
dat <- blackman.wheat

require(lattice)

# Semi-dwarf generally higher yielding than conventional
# bwplot(yield~type|loc,dat, main="blackman.wheat")

# Peculiar interaction--Ear/Edn locs have reverse nitro response
dotplot(gen~yield|loc, dat, group=nitro, auto.key=TRUE,
        main="blackman.wheat: yield for low/high nitrogen")

# Height data from table 6 of Blackman.  Height at Trumpington loc.
# Shorter varieties have higher yields, greater response to nitro.
heights <- data.frame(gen=c("Cap", "Dur", "Fun", "Hob", "Hun", "Kin",
                            "Ran", "Spo", "T64", "T68","T95", "Tem"),
                      ht=c(101,76,76,80,98,88,98,81,86,73,78,93))
dat$height <- heights$ht[match(dat$gen, heights$gen)]
xyplot(yield~height|loc,dat,group=nitro,type=c('p','r'),
       main="blackman.wheat",
       subset=loc=="Tru", auto.key=TRUE)

## Not run: 
##D   require(reshape2)
##D   # AMMI-style biplot Fig 6.4 of Gower 2011
##D   dat$env <- factor(paste(dat$loc,dat$nitro,sep="-"))
##D   datm <- acast(dat, gen~env, value.var='yield')
##D   datm <- sweep(datm, 1, rowMeans(datm))
##D   datm <- sweep(datm, 2, colMeans(datm))
##D   biplot(prcomp(datm), main="blackman.wheat AMMI-style biplot")
## End(Not run)




