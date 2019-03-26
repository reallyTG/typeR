library(MBESS)


### Name: vit.fitted
### Title: Visualize individual trajectories with fitted curve and quality
###   of fit
### Aliases: vit.fitted
### Keywords: hplot device dynamic

### ** Examples

## Not run: 
##D # Note that the following example works fine in R (<2.7.0), but not in 
##D # the development version of R-2.7.0 (the cause can be either in this 
##D # function or in the R program)
##D 
##D # data(Gardner.LD)
##D # library(nlme)
##D # Full.grouped.Gardner.LD <- groupedData(Score ~ Trial|ID, data=Gardner.LD, order.groups=FALSE)    
##D 
##D # Examination of the plot reveals that the logistic change model does not adequately describe
##D # the trajectories of individuals 6 and 19 (a negative exponential change model would be 
##D # more appropriate). Thus we remove these two subjects.
##D # grouped.Gardner.LD <- Full.grouped.Gardner.LD[!(Full.grouped.Gardner.LD["ID"]==6 | 
##D #   Full.grouped.Gardner.LD["ID"]==19),]
##D 
##D # G.L.nlsList<- nlsList(SSlogis,grouped.Gardner.LD)
##D # G.L.nlme <- nlme(G.L.nlsList)
##D # to visualize individual trajectories:  vit.fitted(G.L.nlme)
##D # plot 50 percent random trajectories:  vit.fitted(G.L.nlme, pct.rand = 50)
## End(Not run)



