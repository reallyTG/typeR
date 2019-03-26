## routine tests for the normalization methods
library(affy)
library(affydata)

data(Dilution)

n.meth <- normalize.methods(Dilution)

## remove qspline
##n.meth <- n.meth[ ! (n.meth %in% c("qspline"))]

for (m in n.meth) {
  cat("-->method=", m, "...")
  Dilution.n <- normalize(Dilution, method=m)
  cat("done.\n")
}
