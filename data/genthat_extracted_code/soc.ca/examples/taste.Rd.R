library(soc.ca)


### Name: taste
### Title: Taste dataset
### Aliases: taste
### Keywords: data

### ** Examples

## Not run: 
##D # The taste example
##D data(taste)
##D data_taste           <- taste[which(taste$Isup == 'Active'), ]
##D active               <- data.frame(data_taste$TV, data_taste$Film, data_taste$Art, data_taste$Eat)
##D sup                  <- data.frame(data_taste$Gender, data_taste$Age, data_taste$Income)
##D 
##D # Multiple Correspondence Analysis
##D result.mca     <- soc.mca(active, sup)
##D str(result.mca)
##D result.mca
##D 
##D variance(result.mca) # See p.46 in Le Roux(2010)
##D 
##D contribution(result.mca, 1)
##D contribution(result.mca, 2)
##D contribution(result.mca, 1:3, mode = "variable")
##D 
##D map.active(result.mca, point.fill = result.mca$variable)
##D map.active(result.mca,
##D  map.title="Map of active modalities with size of contribution to 1. dimension",
##D  point.size=result.mca$ctr.mod[, 1])
##D map.active(result.mca, 
##D  map.title="Map of active modalities with size of contribution to 2. dimension",
##D  point.size=result.mca$ctr.mod[, 2])
##D 
##D map.ind(result.mca)
##D map.ind(result.mca, dim=c(1, 2), point.color=result.mca$ctr.ind[, 1],
##D  point.shape=18) + scale_color_continuous(low="white", high="black")
##D 
##D # Plot of all dublets
##D map.ind(result.mca, map.title="Map of all unique individuals", point.color=duplicated(active))
##D map.ind(result.mca, map.title="Map with individuals colored by the TV variable",
##D  point.color=active$TV)
##D 
##D # Ellipse 
##D map             <- map.ind(result.mca)
##D map.ellipse(result.mca, map, as.factor(data_taste$Age == '55-64'))
##D 
##D ##### Specific Multiple Correspondence Analysis
##D options(passive= c("Film: CostumeDrama", "TV: Tv-Sport"))
##D result.smca     <- soc.mca(active, sup)
##D result.smca
##D result.smca$names.passive
##D 
##D ##### Class Specific Correspondence Analysis
##D options(passive=NULL)
##D 
##D class.age     <- which(data_taste$Age == '55-64')
##D result.csca   <- soc.csa(result.mca, class.age, sup)
##D str(result.csca)
##D # Correlations
##D csa.measures(result.csca)
##D variance(result.csca)
##D contribution(result.csca, 1)
##D contribution(result.csca, 2)
##D contribution(result.csca, 1:3, mode = "variable")
##D 
##D # Plots
##D map.ind(result.csca)
##D map.csa.mca(result.csca)
##D map.csa.mca.array(result.csca)
## End(Not run)



