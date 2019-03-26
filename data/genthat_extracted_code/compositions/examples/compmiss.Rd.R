library(compositions)


### Name: missing.compositions
### Title: The policy of treatment of missing values in the "compositions"
###   package
### Aliases: missingsInCompositions compositions.missing
###   compositions.missings composition.missing composition.missings
###   missings is.BDL is.SZ is.MAR is.MNAR is.WMNAR is.MNV is.NMV is.WMNAR
###   is.WZERO has.missings has.missings.default has.missings.rmult SZ MAR
###   MNAR BDL NMV SZvalue MARvalue MNARvalue BDLvalue
### Keywords: multivariate

### ** Examples

require(compositions)      # load library
data(SimulatedAmounts)     # load data sa.lognormals
dat <- acomp(sa.missings)
dat
var(dat)
mean(dat)
plot(dat)
boxplot(dat)
barplot(dat)



