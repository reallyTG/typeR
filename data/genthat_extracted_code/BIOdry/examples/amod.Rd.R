library(BIOdry)


### Name: amod
### Title: Allometric scaling.
### Aliases: amod

### ** Examples

## Simulating TRW records:
set.seed(1)
trw <- ts(abs(rnorm(12,1,1)),start = 1950)
## Cumulative TRW:
cri <- cumsum(trw)
## tree diameters
td <- amod(cri,mp = c(2,1))
## plot of the tree diameters and the
## relative increments:
plot(ts(td))



