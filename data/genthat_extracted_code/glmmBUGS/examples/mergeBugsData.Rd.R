library(glmmBUGS)


### Name: mergeBugsData-methods
### Title: Merge results from BUGS into a data.frame or SPDF
### Aliases: mergeBugsData mergeBugsData-methods
###   mergeBugsData,data.frame-method
###   mergeBugsData,SpatialPolygonsDataFrame-method

### ** Examples

if(require('diseasemapping')){
	data('popdata')
	newdata = c("3560102"=2, "3560104"=3)
	popdatatry = mergeBugsData(popdata, newdata, by.x="CSDUID")
}




