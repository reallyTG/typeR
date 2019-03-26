library(HistDAWass)


### Name: WH.plot_multiple_indivs
### Title: Plot histograms of individuals after a Multiple factor analysis
###   of Histogram Variables
### Aliases: WH.plot_multiple_indivs

### ** Examples

#Do a MultiplePCA on the BLOOD dataset
## Not run: 
##D #' results=WH.MultiplePCA(BLOOD,list.of.vars = c(1:3)) 
##D #Plot histograms of variable 1 of BLOOD dataset on the first 
##D #factorial plane showing histograms
##D WH.plot_multiple_indivs(BLOOD,results,axes=c(1,2),var=1,strx=0.1,
##D  stry=0.1, HISTO=TRUE)
##D #Plot histograms of variable 1 of BLOOD dataset on the first 
##D #factorial plane showing densities
##D WH.plot_multiple_indivs(BLOOD,results,axes=c(1,2),var=1,strx=0.1,
##D  stry=0.1, HISTO=FALSE)
##D  
## End(Not run)



