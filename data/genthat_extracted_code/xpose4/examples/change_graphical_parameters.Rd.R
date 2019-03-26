library(xpose4)


### Name: change_graphical_parameters
### Title: Functions changing variable definitions in Xpose 4
### Aliases: change_graphical_parameters change.ab.graph.par
###   change.bw.graph.par change.cond.graph.par change.dil.graph.par
###   change.label.par change.lm.graph.par change.misc.graph.par
###   change.pi.graph.par change.smooth.graph.par

### ** Examples


## Not run: 
##D ## xpdb5 is an Xpose data object
##D ## We expect to find the required NONMEM run and table files for run
##D ## 5 in the current working directory
##D xpdb5 <- xpose.data(5)
##D 
##D ## Change default miscellaneous graphic preferences
##D xpdb5 <- change.misc.graph.par(xpdb5)
##D 
##D ## Change default linear regression line preferences, creating a new 
##D ## object
##D xpdb5.a <- change.lm.graph.par(xpdb5)
##D 
##D ## Change conditioning preferences
##D xpdb5 <- change.cond.graph.par(xpdb5)
## End(Not run)





