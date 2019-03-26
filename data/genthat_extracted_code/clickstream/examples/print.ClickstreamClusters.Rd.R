library(clickstream)


### Name: print.ClickstreamClusters
### Title: Prints a ClickstreamClusters Object
### Aliases: print.ClickstreamClusters

### ** Examples


clickstreams <- c("User1,h,c,c,p,c,h,c,p,p,c,p,p,o",
               "User2,i,c,i,c,c,c,d",
               "User3,h,i,c,i,c,p,c,c,p,c,c,i,d",
               "User4,c,c,p,c,d",
               "User5,h,c,c,p,p,c,p,p,p,i,p,o",
               "User6,i,h,c,c,p,p,c,p,c,d")
csf <- tempfile()
writeLines(clickstreams, csf)
cls <- readClickstreams(csf, header = TRUE)
clusters <- clusterClickstreams(cls, order = 0, centers = 2)
print(clusters)




