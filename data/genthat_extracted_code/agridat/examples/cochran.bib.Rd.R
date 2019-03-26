library(agridat)


### Name: cochran.bib
### Title: Multi-environment trial of corn, balanced incomplete block
###   design
### Aliases: cochran.bib

### ** Examples


data(cochran.bib)
dat <- cochran.bib

# Show the incomplete-block structure
require(lattice)
redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
levelplot(yield~loc*gen, dat,
          col.regions=redblue,
          xlab="loc (block)", main="cochran.bib - incomplete blocks")

with(dat, table(gen,loc))
rowSums(as.matrix(with(dat, table(gen,loc))))
colSums(as.matrix(with(dat, table(gen,loc))))

m1 = aov(yield ~ gen + Error(loc), data=dat)
summary(m1)

require(nlme)
m2 = lme(yield ~ -1 + gen, data=dat, random=~1|loc)




