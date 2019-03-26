library(deltar)


### Name: dr_pair
### Title: Calculate Delta R from a pair of dates
### Aliases: dr_pair

### ** Examples

## Calculation of Delta R for the last pair (pair 9)
## from the "adak" data set (see Khasanov et al., 2015
## for details). Terrestrial date of this pair is 835 ± 20
## (laboratory code NUTA2-20937), marine date 1765 ± 20
## (laboratory code NUTA2-20553).

# Compute and store the results in the new object
p9 <- dr_pair(dates = c(835, 20, 1765, 20), name = "Adak, pair 9")
# Mean value of Delta R
p9$mean
# Median value of Delta R
p9$median
# Standard deviation of Delta R
p9$sd
# An interval containing true Delta R value with probability 0.95
p9$quantile
# p value of Kolomogorov - Smirnov test
p9$p.value

## Calculation of Delta R for the pair of terrestrial and
## marine materials from the Lazaret Midden (Moreton Bay,
## Australia). Charcoal sample was dated 500 ± 50
## (laboratory code Wk-8009) and marine shell yielded 840 ± 50
## (laboratory code Wk-8013). Data from Ulm et al, 2009, table 2.

# Compute and store the results in the new object
# Note, that for 14C dates from the Southern Hemisphere
# "shcal13" curve is used
LM <- dr_pair(c(500, 50, 840, 50), name = "Lazaret Midden", calCurves = "shcal13")

## Calculation of Delta R for the coral M2-3 dated
## 2170 ± 15 with 230Th and 2550 ± 30 with radiocarbon
## (data from Yu et al, 2010; table 2)

# Compute and store the results in the new object
# Note, that 230Th dates do not need calibration
M2_3 <- dr_pair(c(2170, 15, 2550, 30),  name = "M2-3", calCurves = "normal")



