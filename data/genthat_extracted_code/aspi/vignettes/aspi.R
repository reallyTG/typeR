## ------------------------------------------------------------------------
library(aspi)

## ------------------------------------------------------------------------
head(diplostomum_eyes_excl_lenses, 10)

## ------------------------------------------------------------------------
results <- g.test(diplostomum_eyes_excl_lenses)

## ------------------------------------------------------------------------
results$summary

## ------------------------------------------------------------------------
#total number of parasites on left side
sum(diplostomum_eyes_excl_lenses$left)
#total number of parasites on right side
sum(diplostomum_eyes_excl_lenses$right)
#ratio
sum(diplostomum_eyes_excl_lenses$left) / sum(diplostomum_eyes_excl_lenses$right)

## ------------------------------------------------------------------------
head(results$hosts, 10)

## ------------------------------------------------------------------------
sum(results$hosts$Holm<0.05)

## ------------------------------------------------------------------------
sum(results$hosts$BH<0.05)

## ------------------------------------------------------------------------
# Number of asymmetric infections showing left bias
sum(results$hosts$BH<0.05 & results$hosts$Left>results$hosts$Right)
# Number of asymmetric infections showing right bias
sum(results$hosts$BH<0.05 & results$hosts$Right>results$hosts$Left)

## ---- fig.show='hold'----------------------------------------------------

plotHistogram(diplostomum_eyes_excl_lenses, nBreaks=20, main="Histogram")

## ---- fig.show='hold'----------------------------------------------------
plotVolcano(diplostomum_eyes_excl_lenses, test="G", pAdj="BH", sigThresh=0.1,
main="Volcano Plot")

## ------------------------------------------------------------------------
head(diplostomum_lenses, 10)

## ------------------------------------------------------------------------
sum(diplostomum_lenses$left>0 | diplostomum_lenses$right>0)

## ------------------------------------------------------------------------
results <- eb.test(diplostomum_lenses)
# pooled test p-value
results$pooled
# results for the first ten infected hosts
head(results$hosts, 10)
# smallest FDR adjusted p-value for an individual host
min(results$hosts$BH)

## ------------------------------------------------------------------------
length(results$hosts[,1])

## ------------------------------------------------------------------------
g.test(simulated_symmetrical_infection)

## ------------------------------------------------------------------------
g.test(simulated_left_bias_heterogeneous_proportions)

## ------------------------------------------------------------------------
g.test(simulated_left_bias_homogeneous_proportions)

## ------------------------------------------------------------------------
g.test(simulated_asymmetry_inconsistent_bias)

