library(paleotree)


### Name: kanto
### Title: Example Species Abundances Tables
### Aliases: kanto
### Keywords: datasets

### ** Examples


data(kanto)

#visualize site abundances as barplots
barplotAbund <- function(x){
	x <- x[,colSums(x)>0]
	layout(1:(nrow(x)+1))
	xpar <- par(mar = c(0,7,2,0))
	for(i in 1:(nrow(x)-1)){
		barplot(x[i,],ylab = rownames(x)[i],
			names.arg = "")
		}
	barplot(x[nrow(x),],
		ylab = rownames(x)[nrow(x)],las = 3)
	par(xpar)
	layout(1)
	mtext("Abundances",side = 2,line = 3,adj = 0.8)
	}

#first five sites
kanto5 <- kanto[1:5,]
barplotAbund(kanto5)

#get pairwise Spearman rho coefficients
rhoCoeff <- pairwiseSpearmanRho(kanto,dropAbsent = "bothAbsent")

#what are the nearest-neighbor rhos (largest rho correlations)?
diag(rhoCoeff) <- NA
rhoNearest <- apply(rhoCoeff,1,max,na.rm = TRUE)
rhoNearest

# We can see the power plant sample is extremely different from the rest

# measure evenness: Hurlbert's PIE

kantoPIE <- HurlbertPIE(kanto)

# compare to dominance (relative abundance of most abundant taxon)

dominance <- apply(kanto,1,function(x) max(x)/sum(x) )

plot(kantoPIE,dominance)

# relatively strong relationship!


## Not run: 
##D #######################
##D # Some Cool Ecology Stuff With Other Packages
##D 
##D # basically all the analyses & visualizations
##D 		#for ecology in R that I think are awesome
##D 
##D 
##D ###########################
##D #Ordination (PCO, DCA)
##D 
##D #get bray-curtis distances
##D library(vegan)
##D bcDist <- vegdist(kanto,method = "bray")
##D 
##D # do a PCO on the bray-curtis distances
##D pcoRes <- pcoa(bcDist,correction = "lingoes")
##D scores <- pcoRes$vectors
##D # plot the PCO
##D plot(scores,type = "n")
##D text(labels = rownames(kanto),scores[,1],scores[,2],cex = 0.5)
##D 
##D # the way the power plant and the pokemon tower converge
##D 	# is very suspicious: may be distortion due to a long gradient
##D 
##D # do a DCA instead with vegan's decorana
##D dcaRes <- decorana(kanto)
##D # plot using native vegan functions
##D 	   #will show species scores in red
##D plot(dcaRes,cex = 0.5)
##D #kind of messy
##D 
##D #show just the sites scores
##D plot(dcaRes,cex = 0.5,display = "sites")
##D 
##D #show just the species scores
##D plot(dcaRes,cex = 0.5,display = "species")
##D 
##D #well, that's pretty cool
##D 
##D #######################
##D #get the nearest neighbor for each site
##D     # based on pair-wise rho coefficients
##D rhoNeighbor <- apply(rhoCoeff,1,function(x)
##D 	    rownames(kanto)[tail(order(x,na.last = NA),1)])
##D 
##D #let's plot the nearest neighbor connections with igraph
##D NNtable <- cbind(rownames(kanto),rhoNeighbor)
##D 
##D # now plot with igraph
##D library(igraph)
##D NNlist <- graph.data.frame(NNtable)
##D plot(NNlist)
##D 
##D #arrows point at the nearest neighbor of each sample
##D 	    # based on maximum Spearman rho correlation
##D 
##D ##################################
##D # Two Way Cluster With Heatmap
##D 
##D # This example based on code provided by Max Christie
##D 
##D # load pheatmap library for this example
##D library(pheatmap) 
##D 
##D # get distance matrices for sites and taxa
##D 	# based on bray-curtis dist
##D 	# standardized to total abundance
##D 
##D # standardize site matrix to relative abundance
##D siteStand <- decostand(kanto, method = "total")
##D # site distance matrix (Bray-Curtis)
##D siteDist <- vegdist(siteStand, "bray", diag = TRUE)
##D 
##D # standardize taxa matrix to relative abundance
##D taxaStand <- decostand(t(kanto), method = "total")
##D # taxa distance matrix (Bray-Curtis)
##D taxaDist <- vegdist(taxaStand, "bray", diag = TRUE)
##D 
##D ### Need to set graphic parameters for table
##D 
##D # Check out range of values for relative abundance
##D # hist(myStand) # none get very high...
##D 
##D # number of breaks: number of colors for heatmap
##D nBreaks <- 15
##D 
##D # set underValue
##D 	# anything below this counts as not appearing
##D 	# at that site for visualization purposes
##D underValue <-  min(siteStand[siteStand>0])-min(siteStand[siteStand>0])/10
##D # set overValue (max relative abundance)
##D overValue <- max(siteStand)
##D # you can set your breaks to any sequence you want
##D 	# and they don't have to be the same length.  
##D 	# You can do this manually too.
##D # here we added a 0 to 'underValue' bin to 
##D 	# the heatmap, making this bin essentially 0.
##D colorBreaks <- c(0,seq(underValue,max(siteStand), 
##D 	by = max(siteStand)/(nBreaks-1)))
##D # here we used the function rainbow to create a vector of colors.  
##D 	# You can set these colors yourself too.  
##D # It is important that this vector is one element 
##D 	# less than the myBreaks vector
##D rainColors <- rainbow(nBreaks) 
##D # now we can add "white" onto the vector, 
##D 	# this will be the first color bin, 
##D 	# which we're going to set to be (essentially) 0.  
##D rainColors <- c("white", rainColors) 
##D # If you don't add white, taxa at 0 abundance get colored in
##D 
##D ### Plot the 2-Way Cluster
##D 
##D # heatmap, with user-set colors
##D # feed the function a distance matrix we wanted to use.  
##D 	#siteDist and taxaDist made above by vegdist (bray-curtis)
##D # scale is the relative abundance, let's label it as such
##D 
##D 
##D dev.new(width = 10)
##D #for some reason, mtext() doesn't recognize pheatmap as plot.new
##D plot.new(width = 7) 
##D pheatmap(siteStand, color = rainColors, breaks = colorBreaks, 
##D 	clustering_method = "ward.D", 
##D 	clustering_distance_rows = siteDist, 
##D 	clustering_distance_cols = taxaDist)
##D mtext("Relative Abundance",side = 4,line = -1.4,adj = 0.95)
##D 
##D # pretty cool looking!
##D 
##D ##############################
##D ## Testing for differences between groups of sites
##D 
##D #is there a difference between routes and non-routes
##D groups <- rep(0,nrow(kanto))
##D groups[grep(rownames(kanto),pattern = "Route")] <- 1
##D 
##D #anosim (in vegan)
##D 	#are distances within groups smaller than distances between?
##D #we could also use adonis from vegan instead 
##D library(vegan)
##D 
##D anosim(dat = kanto,grouping = groups)
##D adonis(kanto~factor(groups))
##D #both are very significant
##D 
##D #alternative: using multivariate GLMs in mvabund
##D 
##D library(mvabund)
##D 
##D ft <- manyglm(formula = kanto~factor(groups))
##D anova(ft)
##D #also highly significant!
##D 
##D 
## End(Not run)





