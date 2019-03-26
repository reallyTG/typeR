library(agridat)


### Name: diggle.cow
### Title: Bodyweight of cows in a 2-by-2 factorial experiment
### Aliases: diggle.cow
### Keywords: datasets

### ** Examples


data(diggle.cow)
dat <- diggle.cow

# Figure 1 of Verbyla 1999
require(lattice)
if(require(latticeExtra)){
  useOuterStrips(xyplot(weight ~ day|iron*infect, dat, group=animal,
                        type='b', cex=.5, 
                        main="diggle.cow"))
}

# Scaling
dat <- transform(dat, time = (day-122)/10)

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D   
##D   # Smooth for each animal.  No treatment effects. Similar to SAS Output 38.6.9
##D 
##D   m1 <- asreml(weight ~ 1 + lin(time) + animal + animal:lin(time), data=dat,
##D                random = ~ animal:spl(time))
##D   p1 <- predict(m1, data=dat, classify="animal:time",
##D                 predictpoints=list(time=seq(0,65.9, length=50)))
##D   p1 <- p1$pred$pval
##D   p1 <- merge(dat, p1, all=TRUE) # to get iron/infect merged in
##D   foo1 <- xyplot(weight ~ day|iron*infect, dat, group=animal)
##D   foo2 <- xyplot(predicted.value ~ day|iron*infect, p1, type='l', group=animal)
##D   print(foo1+foo2)
##D 
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   ## require(asreml4)
##D   ## require(latticeExtra)
##D   
##D   ## # Smooth for each animal.  No treatment effects. Similar to SAS Output 38.6.9
##D 
##D   ## m1 <- asreml(weight ~ 1 + lin(time) + animal + animal:lin(time), data=dat,
##D   ##              random = ~ animal:spl(time))
##D   ## p1 <- predict(m1, data=dat, classify="animal:time",
##D   ##               design.points=list(time=seq(0,65.9, length=50)))
##D   ## p1 <- p1$pvals
##D   ## p1 <- merge(dat, p1, all=TRUE) # to get iron/infect merged in
##D   ## foo1 <- xyplot(weight ~ day|iron*infect, dat, group=animal)
##D   ## foo2 <- xyplot(predicted.value ~ day|iron*infect, p1, type='l', group=animal)
##D   ## print(foo1+foo2)
## End(Not run)




