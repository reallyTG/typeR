library(vegan)


### Name: nestedtemp
### Title: Nestedness Indices for Communities of Islands or Patches
### Aliases: nestedtemp nestedchecker nestedn0 nesteddisc nestednodf
###   nestedbetasor nestedbetajac plot.nestedtemp plot.nestednodf
### Keywords: univar

### ** Examples

data(sipoo)
## Matrix temperature
out <- nestedtemp(sipoo)
out
plot(out)
plot(out, kind="incid")
## Use oecosimu to assess the non-randomness of checker board units
nestedchecker(sipoo)
oecosimu(sipoo, nestedchecker, "quasiswap")
## Another Null model and standardized checkerboard score
oecosimu(sipoo, nestedchecker, "r00", statistic = "C.score")



