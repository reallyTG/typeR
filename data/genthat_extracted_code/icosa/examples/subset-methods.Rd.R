library(icosa)


### Name: subset,trigrid-method
### Title: Subsetting an icosahedral grid
### Aliases: [,gridlayer,ANY,missing-method
###   [,gridlayer,Extent,missing-method [,trigrid,ANY,ANY-method
###   [-gridlayer-Extent-method [-gridlayer-index-method [-trigrid-method
###   subset, subset,gridlayer-method subset,hexagrid-method
###   subset,trigrid-method subset-gridlayer-method subset-hexagrid-method
###   subset-trigrid-method

### ** Examples

    #create a triangular grid
        g <- trigrid(c(2,2))
    #make a subset pertaining to the faces
        subG1 <- subset(g, c("F1", "F33"))
    
   #additional way of subsetting
		subG2 <- g[1:15] # selects faces F1 through F15
    logicalSub<-sample(c(TRUE,FALSE), nrow(g@faces), replace=TRUE)
		subG3 <- g[logicalSub]
    #plot the subset in 3d space
        plot3d(subG3)
	# previously mentioned case around the dateline
	gDateLine<-g[c(lomax=-150, lomin=150)]
		plot3d(gDateLine)




