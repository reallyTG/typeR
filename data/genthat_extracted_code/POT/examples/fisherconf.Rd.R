library(POT)


### Name: Fisher Confidence Interval
### Title: Fisher Based Confidence Interval for the GP Distribution
### Aliases: gpd.fishape gpd.fiscale gpd.firl
### Keywords: htest

### ** Examples

data(ardieres)
ardieres <- clust(ardieres, 4, 10 / 365, clust.max = TRUE)
fitted <- fitgpd(ardieres[,"obs"], 5, 'mle')
gpd.fishape(fitted)
gpd.fiscale(fitted)



