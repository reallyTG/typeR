library(agridat)


### Name: shafii.rapeseed
### Title: Multi-environment trial of rapeseed
### Aliases: shafii.rapeseed

### ** Examples


data(shafii.rapeseed)
dat <- shafii.rapeseed

dat$gen <- with(dat, reorder(gen, yield, mean))
dat$loc <- with(dat, reorder(loc, yield, mean))
dat$yield <- dat$yield/1000

dat <- transform(dat, rep=factor(rep), year=as.factor(as.character(year)))
dat$locyr = paste(dat$loc, dat$year, sep="")

# The 'means' of reps
datm <- aggregate(yield~gen+year+loc+locyr, data=dat, FUN=mean)
datm <- datm[order(datm$gen),]
datm$gen <- as.character(datm$gen)
datm$gen <- factor(datm$gen,
                       levels=c("Bienvenu","Bridger","Cascade",
                         "Dwarf","Glacier","Jet"))
dat$locyr <- reorder(dat$locyr, dat$yield, mean)

require(lattice)
# This picture tells most of the story
# Now change symbols
op <- tpg <- trellis.par.get()
tpg$superpose.symbol$pch <- c('7','8','9')
trellis.par.set(tpg)
dotplot(loc~yield|gen,group=year,data=dat,
        auto.key=list(columns=3),
        main="shafii.rapeseed",ylab="Location")
#dotplot(loc~yield|gen,group=year,data=datm,auto.key=TRUE,
#        main="shafii.rapeseed")

# AMMI biplot.  Remove gen and locyr effects.
m1.lm <- lm(yield ~ gen + locyr, data=datm)
datm$res <- resid(m1.lm)
# Convert to a matrix
if(require(reshape2)){
dm <- melt(datm, measure.var='res', id.var=c('gen', 'locyr'))
dmat <- acast(dm, gen~locyr)
# AMMI biplot.  Figure 1 of Shafii (1998)
biplot(prcomp(dmat), main="shafii.rapeseed - AMMI biplot")
}

trellis.par.set(op) # Unset graphics changes




