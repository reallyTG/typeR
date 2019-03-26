library(Thresher)
# get saved data
data(savedSims)
reap <- savedReap[[5]]
dset <- reap@data
labels <- factor(paste("C", predict(reap@fit), sep=""))

# use a different clustering algorithm
hc <- hclust(distanceMatrix(dset, "uncentered"), "average")
newLabels <- paste("New", cutree(hc, k=3), sep="")
tab <- table(OLD=labels, NEW=newLabels)
tab

# now test the methods
indices <- labelMatcher(tab)
tab[indices$ii, indices$jj]

matchLabels(tab)

countAgreement(tab)

labelAccuracy(dset, labels)

bestMetric(dset, labels)
