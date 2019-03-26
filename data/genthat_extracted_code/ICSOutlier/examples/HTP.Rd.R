library(ICSOutlier)


### Name: HTP
### Title: Production Measurements of High-Tech Parts
### Aliases: HTP
### Keywords: datasets

### ** Examples

# HTP data: the observations 581 and 619 are considered as outliers
data(HTP)
outliers <- c(581, 619)
boxplot(HTP)


# Outlier detection using ICS
icsHTP <- ics2(HTP)
# Selection of components based on a Normality Test, for demo purpose only small mDist value,
# but as extreme quantiles are of interest mDist should be much larger.
# Also more cores could be used if available.
icsOutlierDA <- ics.outlier(icsHTP, test = "agostino.test", level.test = 0.05,
                            level.dist = 0.02, mDist = 50, ncores = 1)
icsOutlierDA
summary(icsOutlierDA)
plot(icsOutlierDA)
text(outliers, icsOutlierDA@ics.distances[outliers], outliers, pos = 2, cex = 0.9, col = 2)

## Not run: 
##D # Selection of components based on simulations
##D # This might take a while to run (around 30 minutes)
##D icsOutlierPA <- ics.outlier(icsHTP, method = "simulation", level.dist = 0.02,
##D level.test = 0.05, mEig = 10000, mDist = 10000)
##D icsOutlierPA
##D summary(icsOutlierPA)
##D plot(icsOutlierPA)
##D text(outliers, icsOutlierPA@ics.distances[outliers], outliers, pos = 2, cex = 0.9, col = 2)
## End(Not run)




