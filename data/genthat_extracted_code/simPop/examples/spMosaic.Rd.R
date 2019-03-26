library(simPop)


### Name: spMosaic
### Title: Mosaic plots of expected and realized population sizes
### Aliases: spMosaic
### Keywords: hplot

### ** Examples

set.seed(1234)  # for reproducibility
data(eusilcS)   # load sample data
samp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize",
  strata="db040", weight="db090")
eusilcP <- simStructure(data=samp, method="direct", basicHHvars=c("age","rb090"))
abb <- c("B","LA","Vi","C","St","UA","Sa","T","Vo")
tab <- spTable(eusilcP, select=c("rb090", "db040", "hsize"))

# expected and realized population sizes
spMosaic(tab, method = "split",
  labeling=labeling_border(abbreviate=c(db040=TRUE)))

# realized population sizes colored according to relative
# differences with expected population sizes
spMosaic(tab, method = "color",
  labeling=labeling_border(abbreviate=c(db040=TRUE)))




