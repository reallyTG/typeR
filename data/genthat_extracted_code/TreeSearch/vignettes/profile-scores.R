## ----Set up, echo=FALSE--------------------------------------------------
require(phangorn)
require(TreeSearch)
data(referenceTree)
data(congreveLamsdellMatrices)
dataset <- congreveLamsdellMatrices[[1]]
set.seed(0)

