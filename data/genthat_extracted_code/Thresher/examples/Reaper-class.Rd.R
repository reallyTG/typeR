library(Thresher)


### Name: Reaper-class
### Title: Class '"Reaper"'
### Aliases: Reaper-class Reaper getColors,Reaper-method
###   getSplit,Reaper-method getStyles,Reaper-method
###   makeFigures,Reaper-method
### Keywords: classes cluster

### ** Examples

# Simulate  a data set with some structure
set.seed(250264)
sigma1 <- matrix(0, ncol=16, nrow=16)
sigma1[1:7, 1:7] <- 0.7
sigma1[8:14, 8:14] <- 0.3
diag(sigma1) <- 1
st <- SimThresher(sigma1, nSample=300)
# Threshing is completed; now we can reap
reap <- Reaper(st)
screeplot(reap, col='pink', lcol='red')
scatter(reap)
plot(reap)
heat(reap)



