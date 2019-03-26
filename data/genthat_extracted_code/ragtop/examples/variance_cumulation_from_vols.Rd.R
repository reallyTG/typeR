library(ragtop)


### Name: variance_cumulation_from_vols
### Title: Create a variance cumulation function from a volatility term
###   structure
### Aliases: variance_cumulation_from_vols

### ** Examples

vc = variance_cumulation_from_vols(
  data.frame(time=c(0.1,2,3),
  volatility=c(0.2,0.5,1.2)))
vc(1.5, 0)




