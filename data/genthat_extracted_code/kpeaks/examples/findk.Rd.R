library(kpeaks)


### Name: findk
### Title: Estimate the Number of Clusters in a Data Set
### Aliases: findk
### Keywords: Statistics|cluster

### ** Examples

# Estimate the number of clusters in x5p4c data set
data(x5p4c)
estk <- findk(x5p4c, binrule="sturges")
print(estk)
summary(estk$pcounts)
cat("Estimated the number of clusters as the mean of Q3 and max peak count:", estk$mq3m, fill=TRUE)
cat("Proposed number of clusters based on the mean of two largest estimates:", estk$mtlk, fill=TRUE)

# Estimate the number of clusters in x5p4c data set by using threshold frequency method 'avg' 
# and shoulders removal method 'q1'
estk <- findk(x5p4c, binrule="usr", nbins=15, tcmethod="usr", tc=1, trmethod="avg", rms=TRUE)
print(estk)
summary(estk$pcounts)
cat("Proposed number of clusters based on the mean of two largest estimates:", estk$mtlk, fill=TRUE)

# Estimate the number of clusters in iris data set
data(iris)
estk <- findk(iris[,1:4], binrule="bc", rcs=FALSE)
print(estk)
summary(estk$pcounts)
cat("Proposed number of clusters based on the mean of estimates:", estk$avgk, fill=TRUE)
cat("Proposed number of clusters based on the mode of estimates:", estk$modk, fill=TRUE)
cat("Proposed number of clusters based on the mean of two largest estimates:", estk$mtlk, fill=TRUE)



