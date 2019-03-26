library(metricTester)


### Name: FDis
### Title: Calculate functional dispersion (FDis)
### Aliases: FDis

### ** Examples

#example of how to calculate the FDis of a series of plots based on the trait values
#of a set of species. begin by simulating a phylogeny with a birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

#create a log-normal abundance distribution
sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1)) + 1

#simulate a community data matrix, with species as columns and sites as rows
cdm <- simulateComm(tree, richness.vector=10:25, abundances=sim.abundances)

#simulate two traits and combine into a matrix. because species are sometimes absent
#from the cdm, also exclude any species from the trait data frame that are not in the
#cdm (to avoid errors), then ordinate with a PCA
traits <- evolveTraits(tree)[[2]]
traits <- traits[row.names(traits) %in% colnames(cdm),]
ord <- prcomp(traits)

#the FDis of the species in each plot
FDis(ordination.results=ord$x, road.map=cdm)

#now an example of how to calculate the FDis of a series of species based on the trait
#values of a set of individuals. begin by simulating trait data for a series of
#individuals. to illustrate the point, simulate varying numbers of individuals per
#species, and where there are varying degrees of variance in traits per species. 
traits2 <- data.frame(trait1=c(rnorm(n=30, sd=1), rnorm(n=60, sd=2), rnorm(n=120,sd=4)),
trait2=c(rnorm(n=30, sd=1), rnorm(n=60, sd=2), rnorm(n=120, sd=4)))

#ordinate the traits. could readily use another ordination here, e.g. nmds with gower
ord2 <- prcomp(traits2)

#create a road.map where species are rows and individual observations are columns. the
#first 30 observations belong to sp1, the following 60 to sp2, and the following 120
#to sp3.
cdm2 <- matrix(nrow=3, ncol=dim(traits2)[1], 0)
colnames(cdm2) <- row.names(traits2)
row.names(cdm2) <- c("sp1", "sp2", "sp3")
cdm2[1,1:30] <- 1
cdm2[2,31:90] <- 1
cdm2[3,91:210] <- 1

#the FDis of each species (i.e. niche breadth)
FDis(ordination.results=ord2$x, road.map=cdm2)



