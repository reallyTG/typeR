library(Thresher)


### Name: SignalSet-class
### Title: Class '"SignalSet"'
### Aliases: SignalSet-class SignalSet
### Keywords: classes

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
# now extract the signal set
ss <- reap@signalSet
dim(ss@continuous)
dim(ss@binary)
table(ss@binary[,1], ss@binary[,2])
plot(ss@continuousClusters)



