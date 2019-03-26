library(adehabitatHS)


### Name: gnesfa
### Title: General Niche-Environment System Factor Analysis
### Aliases: gnesfa print.gnesfa
### Keywords: multivariate

### ** Examples


## Not run: 
##D 
##D ################################################################
##D ##
##D ## Study of the habitat selection by the chamois in the French
##D ## mountains of Les Bauges
##D 
##D 
##D ## Loads the data
##D data(bauges)
##D names(bauges)
##D map <- bauges$map
##D locs <- bauges$locs
##D 
##D 
##D ## displays the data
##D mimage(map)
##D image(map,1)
##D points(locs, pch = 3)
##D 
##D 
##D ## Prepares the data for the GNESFA:
##D tab <- slot(map, "data")
##D Dp <- slot(count.points(locs,map), "data")[,1]
##D pc <- dudi.pca(tab, scannf = FALSE)
##D 
##D 
##D ## Example of use with Dp = Reference
##D gn <- gnesfa(pc, Reference = Dp, scannf=FALSE)
##D 
##D ## One main axis:
##D barplot(gn$eig)
##D 
##D ## The correlation with variables indicate that
##D ## the elevation, the proximity to grass and to
##D ## deciduous forests:
##D s.arrow(gn$cor)
##D 
##D ## The factorial map of the niche...
##D scatterniche(gn$li, Dp, pts = TRUE)
##D 
##D ## The chamois is rather located at high elevation,
##D ## in the grass, far from deciduous forests
##D 
##D 
##D 
##D 
##D ##########################################################
##D ##########################################################
##D ##
##D ##
##D ##       Some interesting properties of the GNESFA
##D ##
##D ##
##D ##########################################################
##D ##########################################################
##D 
##D 
##D 
##D ################################
##D ################################
##D ##
##D ## Interesting properties of the
##D ## choice: Dp as Reference
##D ## identical to the MADIFA
##D ## (Calenge et al. 2008),
##D ## See the help page of the function madifa
##D ## for other properties)
##D 
##D gn <- gnesfa(pc, Reference = Dp, scannf=FALSE,
##D              nfFirst = 7)
##D gn
##D 
##D ## This is the same as the MADIFA:
##D mad <- madifa(pc, Dp, scannf=FALSE)
##D 
##D ## Indeed:
##D plot(gn$li[,1], mad$li[,1])
##D cor(gn$li[,1], mad$li[,1])
##D 
##D 
##D ## And consequently the sum of the squared scores,
##D ## On the axes of the GNESFA...
##D su <- apply(gn$l1,1,function(x) sum(x^2))
##D 
##D 
##D ## ... is equal to the Mahalanobis distances between
##D ## the points and the centroid of the niche
##D ## (Clark et al. 1993, see the help page of mahasuhab)
##D 
##D su2 <- slot(mahasuhab(map, locs), "data")[,1]
##D 
##D 
##D ## Indeed:
##D all(su - su2 < 1e-7)
##D plot(su, su2)
##D 
##D 
##D 
##D 
##D ################################
##D ################################
##D ##
##D ## Centering twice is identical to
##D ## the ENFA (Hirzel et al. 2002, see the help
##D ## page of the function enfa)...
##D 
##D 
##D #######
##D ##
##D ## ... If Dp is the Reference:
##D 
##D gn <- gnesfa(pc, Reference = Dp, center = "twice", scannf = FALSE)
##D gn
##D 
##D enf <- enfa(pc, Dp, scannf = FALSE)
##D plot(enf$li[,2], gn$li[,1])
##D cor(enf$li[,2], gn$li[,1])
##D 
##D ## The first specialization axis of the ENFA
##D ## is the first axis of the GNESFA!
##D 
##D 
##D #######
##D ##
##D ## ... If Dp is the Focus:
##D 
##D gn <- gnesfa(pc, Focus = Dp, center = "twice",
##D              scannf = FALSE, nfFirst = 6)
##D plot(enf$li[,2], gn$li[,6])
##D cor(enf$li[,2], gn$li[,6])
##D 
##D ## The first specialization axis of the ENFA
##D ## is the last axis of the GNESFA!
##D 
##D 
##D #######
##D ##
##D ## Whatever the distribution chosen as Reference,
##D ## projecting the cloud of points on the hyperplane
##D ## orthogonal to the marginality axis, and performing
##D ## a GNESFA in this subspace is identical to an ENFA!
##D 
##D 
##D ## The marginality axis of the ENFA is identical
##D ## to the component "projmar" of the GNESFA
##D 
##D plot(enf$li[,1],gn$projmar)
##D cor(enf$li[,1],gn$projmar)
##D 
##D 
##D 
##D 
##D ################################
##D ################################
##D ##
##D ## Interesting properties of the
##D ## case: Dp as Focus, one categorical
##D ## variable. Relationships with the selection
##D ## ratios of Manly et al. (1972, see the
##D ## help page of wi)
##D 
##D 
##D ## For example, take the Elevation, and
##D ## define a factor with 4 levels
##D elev <- data.frame(el = cut(slot(map, "data")$Elevation, 4))
##D 
##D ## Now, compute the complete disjonctive table
##D dis <- acm.disjonctif(elev)
##D head(dis)
##D 
##D ## Now perform the GNESFA with Dp as Focus:
##D pc <- dudi.pca(dis, scannf = FALSE)
##D gn <- gnesfa(pc, Dp, scannf = FALSE, nfFirst = 3)
##D 
##D 
##D #######
##D ##
##D ## This analysis is closely related to the concept of
##D ## selection ratios
##D 
##D ## Compute the percentage of use of each level:
##D us <- apply(dis, 2, function(x) sum(x*Dp)/sum(Dp))
##D av <- apply(dis, 2, function(x) sum(x)/length(x))
##D 
##D ## The selection ratios
##D wi <- widesI(us, av)$wi
##D 
##D ## Compute the sum of the eigenvalue
##D sum(gn$eig)
##D 
##D ## Compute the sum of the selection ratios - 1
##D sum(wi) - 1
##D 
##D ## In other words, when the GNESFA (Dp as Focus) is
##D ## applied on only one categorical variable, this
##D ## analysis finds a set of axes which partition the
##D ## sum of the selection ratios so that it is maximum
##D ## on the first axes!!
##D 
##D 
## End(Not run)




