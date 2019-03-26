library(agridat)


### Name: minnesota.barley.yield
### Title: Multi-environment trial of barley in Minnesoty at 6 sites in
###   1927-1936.
### Aliases: minnesota.barley.yield
### Keywords: datasets

### ** Examples


data(minnesota.barley.yield)
dat <- minnesota.barley.yield
dat$yr <- factor(dat$year)

# Drop Dryland, Jeans, CompCross, MechMixture because they have less than 5
# year-loc values
dat <- droplevels(subset(dat, !is.element(gen, c("CompCross","Dryland","Jeans","MechMixture"))))

# 1934 has huge swings from one loc to the next
require(lattice)
dotplot(gen~yield|site, dat, groups=yr,
        main="minnesota.barley.yield",
        auto.key=list(columns=5), scales=list(y=list(cex=.5)))



