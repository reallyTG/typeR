library(metricTester)


### Name: synthComm
### Title: Create synthetic community niche space
### Aliases: synthComm

### ** Examples

#generate six species' niche spaces of 20 observations each in 3 dimensions. first
#define the centroids of their distributions
centroids <- matrix(nrow=6, ncol=3, rep(seq(from = -2, to = 2, length.out=6), 3))

#brute force the points into a list and reduce back into a large simulated
#ordination.results object

output <- list()

for(i in 1:6)
{
	temp1 <- rnorm(n=20, mean=centroids[i,1], sd=1/i)
	temp2 <- rnorm(n=20, mean=centroids[i,2], sd=1/i)
	temp3 <- rnorm(n=20, mean=centroids[i,3], sd=1/i)
	output[[i]] <- data.frame(temp1, temp2, temp3)
}

totalNiche <- Reduce(rbind, output)

#add a species then color column to totalNiche then scramble to simulate real data
totalNiche$species <- sort(rep(paste("species", 1:6, sep=""),20))

toMerge <- data.frame(species=paste("species", 1:6, sep=""), color=1:6)

totalNiche <- merge(totalNiche, toMerge)

totalNiche <- totalNiche[sample(row.names(totalNiche)),]

#plot the points to give some sense of what it looks like (not run, but works)
#plot(totalNiche[,3]~totalNiche[,2], col=totalNiche$color, pch=20)

#create a road map identifying which points belong to which species
roadMap <- matrix(nrow=6, ncol=120, 0)

row.names(roadMap) <- paste("species", 1:6, sep="")
colnames(roadMap) <- 1:120
roadMap[1,][row.names(totalNiche)[totalNiche$species=="species1"]] <- 1
roadMap[2,][row.names(totalNiche)[totalNiche$species=="species2"]] <- 1
roadMap[3,][row.names(totalNiche)[totalNiche$species=="species3"]] <- 1
roadMap[4,][row.names(totalNiche)[totalNiche$species=="species4"]] <- 1
roadMap[5,][row.names(totalNiche)[totalNiche$species=="species5"]] <- 1
roadMap[6,][row.names(totalNiche)[totalNiche$species=="species6"]] <- 1

roadMap <- as.data.frame(roadMap)

#now run the synthComm null model. exclude 1st and 5th columns since these are species
#names and color, which are not normal inputs
temp <- synthComm(totalNiche[,c(-1,-5)], roadMap)

#plot the points to give some sense of what it looks like (not run, but works)
#plot(temp[,3]~temp[,2], col=temp$species, pch=20)



