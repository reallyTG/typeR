library(agridat)


### Name: fox.wheat
### Title: Multi-environment trial of wheat for 22 varieties at 14 sites in
###   Australia
### Aliases: fox.wheat
### Keywords: datasets

### ** Examples


data(fox.wheat)
dat <- fox.wheat

# Means of varieties.  Slight differences from Fox and Rathjen suggest
# they had more decimals of precision than shown.
tapply(dat$yield, dat$gen, mean)

# Calculate genotype means, merge into the data
genm <- tapply(dat$yield, dat$gen, mean)
dat$genm <- genm[match(dat$gen, names(genm))]

# Calculate slopes for each site.  Matches Fox, Table 2, Col A.
m1 <- lm(yield~site+site:genm, data=dat)
sort(round(coef(m1)[15:28],2), dec=TRUE)

# Figure 1 of Fox
require(lattice)
xyplot(yield~genm|state, data=dat, type=c('p','r'), group=site,
       auto.key=list(columns=4),
       main="fox.wheat", xlab="Variety mean across all sites",
       ylab="Variety yield at each site within states")




