## ----include=FALSE-------------------------------------------------------
library(IndexNumR)

## ------------------------------------------------------------------------
head(CES_sigma_2)

## ------------------------------------------------------------------------
head(CES_sigma_2[order(CES_sigma_2$time),])

## ------------------------------------------------------------------------
priceIndex(CES_sigma_2,pvar = "prices",qvar = "quantities",pervar = "time",prodID = "prodID", indexMethod = "laspeyres", output = "chained")

## ------------------------------------------------------------------------
methods <- c("laspeyres","paasche","fisher","tornqvist")
prices <- lapply(methods, function(x) {priceIndex(CES_sigma_2,pvar = "prices", qvar = "quantities", pervar = "time", prodID = "prodID", indexMethod = x, output = "chained")})
as.data.frame(prices, col.names = methods)

## ------------------------------------------------------------------------
elasticity(CES_sigma_2, pvar="prices",qvar="quantities",pervar="time",prodID="prodID",compIndex="ces")

## ------------------------------------------------------------------------
lq <- relativeDissimilarity(CES_sigma_2, pvar="prices", qvar="quantities", pervar = "time", prodID = "prodID", indexMethod = "fisher", similarityMethod = "logquadratic")
head(lq)

## ------------------------------------------------------------------------
maximumSimilarityLinks(lq)

## ------------------------------------------------------------------------
priceIndex(CES_sigma_2,pvar = "prices",qvar = "quantities",pervar = "time",prodID = "prodID", indexMethod = "laspeyres", output = "chained", chainMethod = "logquadratic")

## ------------------------------------------------------------------------
GEKSIndex(CES_sigma_2, pvar = "prices", qvar = "quantities", pervar = "time", prodID = "prodID", indexMethod = "tornqvist", window=11, splice = "mean")

