## ------------------------------------------------------------------------
library(propr)
data(iris)
keep <- iris$Species %in% c("setosa", "versicolor")
counts <- iris[keep, 1:4] * 10
group <- ifelse(iris[keep, "Species"] == "setosa", "A", "B")

## ---- message = FALSE----------------------------------------------------
pd.nn <- propd(counts, group, weighted = FALSE)

## ---- message = FALSE, eval = FALSE--------------------------------------
#  pd.wn <- propd(counts, group, weighted = TRUE)
#  pd.na <- propd(counts, group, weighted = FALSE, alpha = .01)
#  pd.wa <- propd(counts, group, weighted = TRUE, alpha = .01)

## ---- message = FALSE, eval = FALSE--------------------------------------
#  pd.nn <- updateF(pd.nn, moderated = FALSE)
#  pd.nn@results$Fstat

## ---- message = FALSE, eval = FALSE--------------------------------------
#  pd.nn <- updateF(pd.nn, moderated = TRUE, ivar = "clr")
#  pd.wn <- updateF(pd.wn, moderated = TRUE, ivar = "clr")
#  pd.na <- updateF(pd.na, moderated = TRUE, ivar = "clr")
#  pd.wa <- updateF(pd.wa, moderated = TRUE, ivar = "clr")

