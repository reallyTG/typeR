library(hydrogeo)


### Name: toPercent
### Title: Major ions as a percentage of total major ions
### Aliases: toPercent

### ** Examples

library(hydrogeo)
l <- list( Ca = c(43,10,73,26,32),
          Mg = c(30,50,83,14,62),
          Na = c(54,76,3,14,12),
          K = c(31,22,32,22,11),
          Cl = c(24,10,12,30,43),
          SO4 = c(24,10,12,30,43),
	  CO3 = c(24,10,12,30,43),
	  HCO3 = c(42,110,12,3,4),
          IDs = c("A","B","C","D","E") )
d <- toPercent(l)
# check, should add up to 100%
z <- as.data.frame(d)
for(i in 1:length(z[[1]])) { print(sum(z[i,5:8])) }
for(i in 1:length(z[[1]])) { print(sum(z[i,1:4])) }



