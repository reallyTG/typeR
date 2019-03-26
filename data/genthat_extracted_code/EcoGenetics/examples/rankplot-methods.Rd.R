library(EcoGenetics)


### Name: eco.rankplot
### Title: Rankplot graphs
### Aliases: eco.rankplot eco.rankplot,eco.lsa,missing,missing-method
###   eco.rankplot,eco.lsa-method
###   eco.rankplot,numeric,dataframeORmatrix,missing-method
###   eco.rankplot,numeric-method
###   eco.rankplot,factor,dataframeORmatrix,missing-method
###   eco.rankplot,factor-method

### ** Examples

## Not run: 
##D data(eco3)
##D 
##D # The data set eco3 has 50 points in two sites, 
##D # but points are not visible in a usual X-Y plot, 
##D # due to the small distance among them in relation to the large
##D # distance between sites
##D 
##D var <- eco3[["P"]][,1]
##D plot(eco3[["XY"]], col = var)
##D x <- sample(1:100, 30)
##D y <- sample(1:100, 30)
##D 
##D # in a rankplot graph, the inter-individual distances are
##D # reduced to a single scale
##D rankeco3 <- eco.rankplot(var, eco3[["XY"]])
##D rankeco3
##D 
##D # the rankplot method supports the use of ggplot2 syntax with ggplot2 graphs
##D require(ggplot2)
##D rankeco3 <- eco.rankplot(var, eco3[["XY"]], interactivePlot = FALSE)
##D rankeco3 <- rankeco3 + theme_bw() + theme(legend.position="none")
##D rankeco3
## End(Not run)




