library(evidence)


### Name: crickets
### Title: Made-up data that are not unlike the actual data collected by
###   Nespolo et al.(2003).
### Aliases: crickets
### Keywords: datasets

### ** Examples

data(crickets)
crickets7 <- subset(crickets, crickets$temp==7)
with(crickets7, scatter.smooth(mass, VO2))



