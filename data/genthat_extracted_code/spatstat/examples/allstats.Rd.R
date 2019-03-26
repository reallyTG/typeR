library(spatstat)


### Name: allstats
### Title: Calculate four standard summary functions of a point pattern.
### Aliases: allstats
### Keywords: spatial nonparametric

### ** Examples

	data(swedishpines)
        a <- allstats(swedishpines,dataname="Swedish Pines")
        ## Not run: 
##D         plot(a)
##D         plot(a, subset=list("r<=15","r<=15","r<=15","r<=50"))
##D         
## End(Not run)



