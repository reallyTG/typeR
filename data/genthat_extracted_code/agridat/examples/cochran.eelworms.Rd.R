library(agridat)


### Name: cochran.eelworms
### Title: Counts of eelworms before and after fumigant treatments
### Aliases: cochran.eelworms
### Keywords: datasets

### ** Examples


data(cochran.eelworms)
dat <- cochran.eelworms

# Very strong spatial trends
if(require(desplot)){
  desplot(initial ~ col*row, data=dat,
          flip=TRUE, # aspect unknown
          main="cochran.eelworms")
}


# final counts are strongly related to initial counts
require(lattice)
xyplot(final~initial|factor(dose), data=dat, group=fumigant,
       main="cochran.eelworms - by dose (panel) & fumigant",
       xlab="Initial worm count",
       ylab="Final worm count", auto.key=list(columns=5))

# One approach...log transform, use 'initial' as covariate, create 9 treatments
dat <- transform(dat, trt=factor(paste0(fumigant, dose)))
m1 <- aov(log(final) ~ block + trt + log(initial), data=dat)
anova(m1)



