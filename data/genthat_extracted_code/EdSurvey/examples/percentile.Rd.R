library(EdSurvey)


### Name: percentile
### Title: EdSurvey Percentiles
### Aliases: percentile

### ** Examples

# read in the example data (generated, not real student data)
sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package="NAEPprimer"))

# get the median of the composite
percentile("composite", 50, sdf)

## Not run: 
##D # get several percentiles
##D percentile("composite", c(0,1,25,50,75,99,100), sdf)
##D # build an edsurvey.data.frame.list
##D sdfA <- subset(sdf, scrpsu %in% c(5,45,56))
##D sdfB <- subset(sdf, scrpsu %in% c(75,76,78))
##D sdfC <- subset(sdf, scrpsu %in% 100:200)
##D sdfD <- subset(sdf, scrpsu %in% 201:300)
##D 
##D sdfl <- edsurvey.data.frame.list(list(sdfA, sdfB, sdfC, sdfD),
##D                                  labels=c("A locations",
##D                                            "B locations",
##D                                            "C locations",
##D                                            "D locations"))
##D # this shows how these datasets will be described
##D sdfl$covs
##D 
##D percentile("composite", 50, sdfl)
##D percentile("composite", c(25, 50, 75), sdfl)
## End(Not run)



