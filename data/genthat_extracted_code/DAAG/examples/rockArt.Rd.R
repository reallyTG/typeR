library(DAAG)


### Name: rockArt
### Title: Pacific Rock Art features
### Aliases: rockArt
### Keywords: datasets

### ** Examples

data(rockArt)
rockart.dist <- dist(x = as.matrix(rockArt[, 28:641]), method = "binary")
sum(rockart.dist==1)/length(rockart.dist)
plot(density(rockart.dist, to = 1))
rockart.cmd <- cmdscale(rockart.dist)
tab <- table(rockArt$District)
district <- as.character(rockArt$District)
district[!(rockArt$District %in% names(tab)[tab>5])] <- "other"
## Not run: 
##D xyplot(rockart.cmd[,2] ~ rockart.cmd[,1], groups=district,
##D        auto.key=list(columns=5),
##D        par.settings=list(superpose.symbol=list(pch=16)))
##D library(MASS)
##D ## For sammon, need to avoid zero distances
##D omit <- c(47, 54, 60, 63, 92)
##D rockart.dist <- dist(x = as.matrix(rockArt[-omit, 28:641]), method = "binary")
##D rockart.cmd <- cmdscale(rockart.dist)
##D rockart.sam <- sammon(rockart.dist, rockart.cmd)
##D xyplot(rockart.sam$points[,2] ~ rockart.sam$points[,1],
##D        groups=district[-omit], auto.key=list(columns=5),
##D        par.settings=list(superpose.symbol=list(pch=16)))
##D ## Notice the very different appearance of the Sammon plot
## End(Not run)



