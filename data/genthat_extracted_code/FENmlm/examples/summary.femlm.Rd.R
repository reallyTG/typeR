library(FENmlm)


### Name: summary.femlm
### Title: Summary of a 'femlm' object. Computes different types of
###   standard errors.
### Aliases: summary.femlm

### ** Examples


# Load trade data
data(trade)

# We estimate the effect of distance on trade (with 3 cluster effects)
est_pois = femlm(Euros ~ log(dist_km)|Origin+Destination+Product, trade)

# Comparing different types of standard errors
sum_white = summary(est_pois, se = "white")
sum_oneway = summary(est_pois, se = "cluster")
sum_twoway = summary(est_pois, se = "twoway")
sum_threeway = summary(est_pois, se = "threeway")

res2table(sum_white, sum_oneway, sum_twoway, sum_threeway)

# Alternative ways to cluster the SE:
## Not run: 
##D # two-way clustering: Destination and Product
##D summary(est_pois, se = "twoway", cluster = c("Destination", "Product"))
##D summary(est_pois, se = "twoway", cluster = list(trade$Destination, trade$Product))
## End(Not run)





