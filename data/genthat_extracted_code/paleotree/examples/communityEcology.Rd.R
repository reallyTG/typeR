library(paleotree)


### Name: communityEcology
### Title: Miscellaneous Functions for Community Ecology
### Aliases: communityEcology pairwiseSpearmanRho HurlbertPIE HurlbertPIE

### ** Examples


# let's load some example data:
# a classic dataset collected by Satoshi and Okido from the Kanto region

data(kanto)

rhoBothAbsent <- pairwiseSpearmanRho(kanto,dropAbsent = "bothAbsent")

#other dropping options
rhoEitherAbsent <- pairwiseSpearmanRho(kanto,dropAbsent = "eitherAbsent")
rhoNoDrop <- pairwiseSpearmanRho(kanto,dropAbsent = "noDrop")

#compare
layout(1:3)
lim <- c(-1,1)
plot(rhoBothAbsent, rhoEitherAbsent, xlim = lim, ylim = lim)
	abline(0,1)
plot(rhoBothAbsent, rhoNoDrop, xlim = lim, ylim = lim)
	abline(0,1)
plot(rhoEitherAbsent, rhoNoDrop, xlim = lim, ylim = lim)
	abline(0,1)
layout(1)

#using dropAbsent = "eitherAbsent" reduces the number of taxa so much that
	# the number of taxa present drops too low to be useful
#dropping none of the taxa restricts the rho measures to high coefficients
	# due to the many shared 0s for absent taxa

#############

# Try the rho coefficients as a rescaled dissimilarity
rhoDist <- pairwiseSpearmanRho(kanto,asDistance = TRUE,dropAbsent = "bothAbsent")

# What happens if we use these in typical distance matrix based analyses?

# Cluster analysis
clustRes <- hclust(rhoDist)
plot(clustRes)

# Principle Coordinates Analysis
pcoRes <- pcoa(rhoDist,correction = "lingoes")
scores <- pcoRes$vectors
#plot the PCO
plot(scores,type = "n")
text(labels = rownames(kanto),scores[,1],scores[,2],cex = 0.5)

##################################

# measuring evenness with Hurlbert's PIE

kantoPIE <- HurlbertPIE(kanto)

#histogram
hist(kantoPIE)
#evenness of the kanto data is fairly high

#barplot
parX <- par(mar = c(7,5,3,3))
barplot(kantoPIE,las = 3,cex.names = 0.7,
	ylab = "Hurlbert's PIE",ylim = c(0.5,1),xpd = FALSE)
par(parX)

#and we can see that the Tower has extremely low unevenness
	#...overly high abundance of ghosts?

#let's look at evenness of 5 most abundant taxa
kantoPIE_5 <- HurlbertPIE(kanto,nAnalyze = 5)

#barplot
parX <- par(mar = c(7,5,3,3))
barplot(kantoPIE_5,las = 3,cex.names = 0.7,
	ylab = "Hurlbert's PIE for 5 most abundant taxa",ylim = c(0.5,1),xpd = FALSE)
par(parX)



