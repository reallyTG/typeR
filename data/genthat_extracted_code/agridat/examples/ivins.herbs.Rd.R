library(agridat)


### Name: ivins.herbs
### Title: Percent ground cover of herbage species and nettles.
### Aliases: ivins.herbs
### Keywords: datasets

### ** Examples


data(ivins.herbs)
dat <- ivins.herbs

# Nettle is primarily established in legumes.
require(lattice)
xyplot(herb~nettle|gen, dat, main="ivins.herbs - herb yield vs weeds",
       xlab="Percent groundcover in nettles",
       ylab="Percent groundcover in herbs")

# O'Brien used first 7 species to test gen differences
dat7 <- droplevels(subset(dat, is.element(gen, c('G01','G02','G03','G04','G05','G06','G07'))))
m1 <- lm(herb ~ gen + block, data=dat7)
anova(m1) # gen p-value is .041
## Response: herb
##           Df  Sum Sq Mean Sq F value  Pr(>F)
## gen        6 1083.24 180.540  2.5518 0.04072 *
## block      5  590.69 118.138  1.6698 0.17236
## Residuals 30 2122.48  70.749

friedman.test(herb ~ gen|block, dat7) # gen p-value .056




