library(goeveg)


### Name: ordiselect
### Title: Species selection for ordination plots
### Aliases: ordiselect

### ** Examples

## Calculate DCA
library(vegan)
scheden.dca <- decorana(schedenveg)

## Select the 30% most abundant species and call the result
limited <- ordiselect(schedenveg, scheden.dca, ablim = 0.3)
limited

## Use the result in plotting
plot(scheden.dca, display="n")
points(scheden.dca, display="sites")
points(scheden.dca, display="species",
   select = limited, pch=3, col="red", cex=0.7)
ordipointlabel(scheden.dca, display="species",
   select = limited, col="red", cex=0.7, add = TRUE)

## Select the 30% most frequent species with 50% best axis fit
limited <- ordiselect(schedenveg, scheden.dca, ablim = 0.3,
   fitlim = 0.5, freq = TRUE)

## Select the 30% most abundant species with 60% best environmental fit
## in NDMS for axes 1 & 3
nmds <- metaMDS(schedenveg, k = 3)   # run NMDS
env13 <- envfit(nmds, schedenenv[,2:10], choices=c(1,3))
limited13 <- ordiselect(schedenveg, nmds, ablim = 0.3, fitlim = 0.6,
   choices = c(1,3), method = "vars", env = env13)



