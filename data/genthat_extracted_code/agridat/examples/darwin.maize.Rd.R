library(agridat)


### Name: darwin.maize
### Title: Darwin's maize data of crossed/inbred plant heights
### Aliases: darwin.maize
### Keywords: datasets

### ** Examples


data(darwin.maize)
dat <- darwin.maize

# Compare self-pollination with cross-pollination
require(lattice)
bwplot(height~type, dat, main="darwin.maize")

## Not run: 
##D   require(reshape2)
##D   dm <- melt(dat)
##D   d2 <- dcast(dm, pot+pair~type)
##D   d2$diff <- d2$cross-d2$self
##D   t.test(d2$diff)
##D   ## 	One Sample t-test
##D   ## t = 2.148, df = 14, p-value = 0.0497
##D   ## alternative hypothesis: true mean is not equal to 0
##D   ## 95 percent confidence interval:
##D   ##  0.003899165 5.229434169
## End(Not run)





