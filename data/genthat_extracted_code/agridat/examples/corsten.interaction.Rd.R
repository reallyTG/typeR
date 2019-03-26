library(agridat)


### Name: corsten.interaction
### Title: Multi-environment trial of corn
### Aliases: corsten.interaction

### ** Examples


data(corsten.interaction)
dat <- corsten.interaction

if(require(reshape2)){
m1 <- melt(dat, measure.var='yield')
dmat <- acast(m1, loc~gen)

# Corsten (1990) uses this data to illustrate simultaneous row and
# column clustering based on interaction sums-of-squares.
# There is no (known) function in R to reproduce this analysis
# (please contact the package maintainer if this is not true).
# For comparison, the 'heatmap' function clusters the rows and
# columns _independently_ of each other.
heatmap(dmat, main="corsten.interaction")
}





