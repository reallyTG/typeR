library(saeRobust)


### Name: variance
### Title: Construct variance
### Aliases: variance variance.fitrfh variance.fitrsfh variance.fitrtfh
###   variance.fitrstfh weights.fitrfh

### ** Examples

data("grapes", package = "sae")
data("grapesprox", package = "sae")

fitRFH <- rfh(
  grapehect ~ area + workdays - 1,
  data = grapes,
  samplingVar = "var"
)

# The variance component of a mixed linear model:
matV <- variance(fitRFH)
# The full variance matrix:
matV$V()

# The sampling error component
matV$Ve()

# the random effects component
matV$Vu()



