library(metricTester)


### Name: dispersalNull
### Title: Randomize community data matrix with dispersal null model
### Aliases: dispersalNull

### ** Examples

#set up a matrix to simulate lat/long
coordDF <- matrix(ncol=2, nrow=100)

coordDF[,1] <- runif(n=100, min=40, max=50)
coordDF[,2] <- runif(n=100, min=-130, max=-120)

#convert to data frame, give column names. also give row names such as if the cells had
#names (as they should or there'd be no way to track them)
coordDF <- as.data.frame(coordDF)

row.names(coordDF) <- paste("cell", 1:100, sep="")

names(coordDF) <- c("latitude","longitude")

#calculate the distances among all of these points. in the real program you're going to
#want to calculate great arc distance or whatever it's called
distances <- dist(coordDF, diag=TRUE, upper=TRUE)

#turn it into a symmetric distance matrix
distances <- as.matrix(distances)

#simulate a regional phylogeny of 100 species
tree <- geiger::sim.bdtree(b=1, d=0, stop="taxa", n=100)

#simulate a community data matrix of 100 cells by 100 species. do it 4 times so that
#you can use your simulateComm function and have it span a reasonable range of richness
sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1)) + 1

cdm1 <- simulateComm(tree, richness.vector=10:34, abundances=sim.abundances)
cdm2 <- simulateComm(tree, richness.vector=10:34, abundances=sim.abundances)
cdm3 <- simulateComm(tree, richness.vector=10:34, abundances=sim.abundances)
cdm4 <- simulateComm(tree, richness.vector=10:34, abundances=sim.abundances)

#bind these into a list and use dplyr rbind_all to bind together. recast as data frame

cdmList <- list(cdm1, cdm2, cdm3, cdm4)

cdm <- dplyr::bind_rows(cdmList)

cdm <- as.data.frame(cdm)

#fix as necessary manually here (i.e. make sure dimensions are 100 x 100), seems to 
#usually work. then give cell names

row.names(cdm) <- paste("cell", 1:100, sep="")

#fill NAs with 0s.

cdm[is.na(cdm)] <- 0

#not run
#newCDM <- dispersalNull(cdm, tree, distances)



