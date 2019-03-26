library(CommEcol)


### Name: standExtent
### Title: Standardization of spatial extent for two metacommunities by
###   subsampling
### Aliases: standExtent

### ** Examples

### Data
large.lat <- seq(2, 16, 2)
large.lon <- seq(2, 16, 2)
large.coo <- expand.grid(large.lon, large.lat)
large.coo[, 1] <- large.coo[, 1] + rnorm(64, sd=0.4)
large.coo[, 2] <- large.coo[, 2] + rnorm(64, sd=0.4)
rownames(large.coo) <- as.character(paste("large", 1:64, sep=""))
large.distances <- dist(large.coo) 

small.lat <- 1:8 # notice the spatial extent here is much
                  # smaller than that of the "large" set above.
small.lon <- 1:8
small.coo <- expand.grid(small.lon, small.lat)
small.coo[, 1] <- small.coo[, 1] + rnorm(64, sd=0.4)
small.coo[, 2] <- small.coo[, 2] + rnorm(64, sd=0.4)
rownames(small.coo) <- as.character(paste("small", 1:64, sep=""))
small.distances <- dist(small.coo) 

### Example 1 - Graphical demonstration of the subsampling process 
resu <- standExtent(d.large = large.distances, d.small=small.distances,
                    ini.large="large52", ini.small="small45")
                    
plot(2:64, resu[2:64, "percent.dif"]) 
# Notice the subit increase of the curve. This happens because the average distance 
# in the small metacommunity can not follow the increase in its large metacommunity.

par(mfrow=c(2,1))
par(mar=c(1.7, 2, 1.2, 1.2))
plot(large.coo, xlim=c(0, 17), ylim=c(0, 17))
text(10, 16, "Large")
points(large.coo[resu[1, "site.large"],], col="blue", pch=15)
count <- 1
threshold <- 0
while(threshold <= 5 | count <= 7){ # using a threshold of 5 percent or at least 7 
                                      # sites are accumulated. The later is due to
                                      # large variations when number of sites is low.
   count <- count+1
   points(large.coo[resu[count,"site.large"],], col="red", pch=15)
   threshold <- abs(resu[count, "percent.dif"])
   Sys.sleep(0.05)
} # Wait a little bit and watch the plot until the plotting of red dot stops.

par(mar=c(1.7, 2, 1.2, 1.2)) 
plot(small.coo, xlim=c(0, 17), ylim=c(0, 17)) # notice the reduced spatil extent.
text(10, 16, "Small")
points(small.coo[resu[1,"site.small"],], col="blue", pch=15)
count <- 1
threshold <- 0
while(threshold <= 5 | count <= 7){
   count <- count+1
   points(small.coo[resu[count,"site.small"],], col="red", pch=15)
   threshold <- abs(resu[count, "percent.dif"])
   Sys.sleep(0.05)
}

### Example 2 - Generation of 3 paired standardized spatial extents
### using each of the three first sites in the larger spatial extent
### as ini.large.
names.large <- rownames(large.coo)[1:3]
resu.list <- vector(mode="list", length=3)
names(resu.list) <- names.large
for(i in names.large){
   print(i)
   resu.list[[i]] <- standExtent(d.large = large.distances, 
                                 d.small=small.distances,
                                 ini.large=i)
}
resu.list



