library(dad)


### Name: fhclustd
### Title: Hierarchic cluster analysis of probability densities
### Aliases: fhclustd

### ** Examples

data(castles.dated)
stones <- castles.dated$stones
periods <- castles.dated$periods

periods123 <- periods[periods$period %in% 1:3, "castle"]
stones123 <- stones[stones$castle %in% periods123, ]
stones123$castle <- as.factor(as.character(stones123$castle))
yf <- as.folder(stones123)


# Jeffreys measure (default):

resultjef <- fhclustd(yf)
print(resultjef)
print(resultjef, dist.print = TRUE)
plot(resultjef)
plot(resultjef, hang = -1)

# Use cutree (stats package) to get the partition
cutree(resultjef$clust, k = 1:4)
cutree(resultjef$clust, k = 5)
cutree(resultjef$clust, h = 0.041)


# Hellinger distance:

resulthel <- fhclustd(yf, distance = "hellinger")
print(resulthel)
print(resulthel, dist.print = TRUE)
plot(resulthel)
plot(resulthel, hang = -1)

# Use cutree (stats package) to get the partition
cutree(resulthel$clust, k = 1:4)
cutree(resulthel$clust, k = 5)
cutree(resulthel$clust, h = 0.041)


## Not run: 
##D # L2-distance:
##D 
##D xf <- as.folder(stones)
##D result <- fhclustd(xf, distance = "l2")
##D print(result)
##D print(result, dist.print = TRUE)
##D plot(result)
##D plot(result, hang = -1)
##D 
##D # Use cutree (stats package) to get the partition
##D cutree(result$clust, k = 1:5)
##D cutree(result$clust, k = 5)
##D cutree(result$clust, h = 0.18)
## End(Not run)

periods123 <- periods[periods$period %in% 1:3, "castle"]
stones123 <- stones[stones$castle %in% periods123, ]
stones123$castle <- as.factor(as.character(stones123$castle))
yf <- as.folder(stones123)
result123 <- fhclustd(yf, distance = "l2")
print(result123)
print(result123, dist.print = TRUE)
plot(result123)
plot(result123, hang = -1)

# Use cutree (stats package) to get the partition
cutree(result123$clust, k = 1:4)
cutree(result123$clust, k = 5)
cutree(result123$clust, h = 0.041)



