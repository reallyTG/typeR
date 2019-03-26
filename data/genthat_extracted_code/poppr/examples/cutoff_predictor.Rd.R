library(poppr)


### Name: cutoff_predictor
### Title: Predict cutoff thresholds for use with mlg.filter
### Aliases: cutoff_predictor

### ** Examples


data(Pinf)
pinfreps <- fix_replen(Pinf, c(2, 2, 6, 2, 2, 2, 2, 2, 3, 3, 2))
pthresh  <- filter_stats(Pinf, distance = bruvo.dist, replen = pinfreps, 
                         plot = TRUE, stats = "THRESHOLD", threads = 1L)

# prediction for farthest neighbor
cutoff_predictor(pthresh$farthest)

# prediction for all algorithms
sapply(pthresh, cutoff_predictor)




