library(PracTools)


### Name: BW2stagePPSe
### Title: Estimated relvariance components for 2-stage sample
### Aliases: BW2stagePPSe
### Keywords: methods survey

### ** Examples

## Not run: 
##D require(sampling)
##D require(reshape)      # has function that allows renaming variables
##D data(MDarea.pop)
##D Ni <- table(MDarea.pop$TRACT)
##D m <- 20
##D probi <- m*Ni / sum(Ni)
##D     # select sample of clusters
##D sam <- cluster(data=MDarea.pop, clustername="TRACT", size=m, method="systematic",
##D                 pik=probi, description=TRUE)
##D     # extract data for the sample clusters
##D samclus <- getdata(MDarea.pop, sam)
##D samclus <- rename(samclus, c(Prob = "pi1"))
##D 
##D 
##D     # treat sample clusters as strata and select srswor from each
##D s <- strata(data = as.data.frame(samclus), stratanames = "TRACT",
##D             size = rep(50,m), method="srswor")
##D # extracts the observed data
##D samdat <- getdata(samclus,s)
##D samdat <- rename(samdat, c(Prob = "pi2"))
##D 
##D     # extract pop counts for PSUs in sample
##D pick <- names(Ni) %in% sort(unique(samdat$TRACT))
##D Ni.sam <- Ni[pick]
##D pp <- Ni.sam / sum(Ni)
##D wt <- 1/samdat$pi1/samdat$pi2
##D 
##D BW2stagePPSe(Ni = Ni.sam, ni = rep(50,20), X = samdat$y1,
##D             psuID = samdat$TRACT, w = wt,
##D             m = 20, pp = pp)
## End(Not run)



