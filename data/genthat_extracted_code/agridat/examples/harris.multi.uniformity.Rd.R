library(agridat)


### Name: harris.multi.uniformity
### Title: Uniformity trials with multiple crops, 15 years on the same land
### Aliases: harris.multi.uniformity
### Keywords: datasets

### ** Examples


data(harris.multi.uniformity)
dat <- harris.multi.uniformity
# Combine year/crop into 'harvest'
dat <- transform(dat, harv = factor(paste0(year,".",crop)))
# Convert 1911 from tons to pounds
dat$yield[dat$year==1911] <- 340 * dat$yield[dat$year==1911]

# Average yields. Harris 1928, table 2.
aggregate(yield~harv, dat, mean)

# Corrgram
if(require(reshape2) & require(corrgram)){
  mat <- acast(dat, series+plot~harv, value.var='yield')
  corrgram(mat, main="harris.multi.uniformity - correlation of crop yields")
}

# Compare to Harris 1928, table 4.  More positive than negative correlations.
# densityplot(as.vector(cor(mat)), xlab="correlations",
#             main="harris.multi.uniformity")

## Not run: 
##D   
##D # Standardize yields for each year
##D mats <- scale(mat)
##D # Melt and re-name columns so we can make field maps.  Obvious spatial
##D # patterns that persist over years
##D d2 <- melt(mats)
##D names(d2) <- c('ord','harv','yield')
##D d2$series <- as.numeric(substring(d2$ord,1,1))
##D d2$plot <- as.numeric(substring(d2$ord,3))
##D 
##D # Series 2 is on the east side, so switch 2 and 3 for correct plotting
##D d2$xord <- 5 - dat$series
##D # Note that for alfalfa, higher-yielding plots in 1912-1914 were
##D # lower-yielding in 1922-1923.
##D if(require(desplot)){
##D   desplot(yield ~ xord*plot|harv, d2,
##D           aspect=536/639, flip=TRUE, # true aspect
##D           main="harris.multi.uniformity")
##D 
##D # Crude fertility map by averaging across years shows probable
##D # sub-surface water effects
##D agg <- aggregate(yield ~ xord + plot, data=d2, mean)
##D desplot(yield ~ xord + plot, agg,
##D         aspect=536/639, # true aspect
##D         main="harris.multi.uniformity fertility")
##D 
##D }
##D 
## End(Not run) # dontrun




