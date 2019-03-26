library(interflex)


### Name: inter.binning
### Title: The Binning Estimator
### Aliases: inter.binning
### Keywords: graphics

### ** Examples

library(interflex)
data(interflex)
inter.binning(Y = "Y", D = "D", X = "X", Z = "Z1",
                  data = s1, nbins = 3, vartype = "homoscedastic",
                  Ylabel = "Y", Dlabel = "Tr", Xlabel="X")

## specifying cutoffs
inter.binning(Y = "Y", D = "D", X = "X", Z = "Z1",
                  data = s2, cutoffs = c(1,2,4,5))

## with fixed effects
s4[,"wgt"] <- 1
inter.binning(Y = "Y", D = "D", X = "X", Z = "Z1",
                  weights = "wgt", FE = c("group","year"),
                  data = s4, cl = "group", vartype = "cluster")



