library(FENmlm)


### Name: confint.femlm
### Title: Confidence interval for parameters estimated with femlm
### Aliases: confint.femlm

### ** Examples


# Load trade data
data(trade)

# We estimate the effect of distance on trade (with 3 cluster effects)
est_pois = femlm(Euros ~ log(dist_km) + log(Year) | Origin + Destination +
                 Product, trade)

# confidence interval with "normal" VCOV
confint(est_pois)

# confidence interval with "clustered" VCOV (w.r.t. the Origin factor)
confint(est_pois, se = "cluster")





