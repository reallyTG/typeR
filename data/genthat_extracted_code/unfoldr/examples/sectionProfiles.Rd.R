library(unfoldr)


### Name: sectionProfiles
### Title: Construct section profiles
### Aliases: sectionProfiles

### ** Examples

 # load data set
 data(data15p)
 
 # matrix of semi-axes lengths (major,minor)
 AC <- data.matrix(data15p[c("A","C")])/1000	

 # selecting the minor semi-axis for prolate type of spheroids:
 # independent of nomenclature (always named \code{A})
 sp <- sectionProfiles(AC,unlist(data15p["alpha"]))

 summary(sp$A)			# here minor semi-axis because of prolate
 summary(sp$S)			# shape factor
 summary(sp$alpha)		# angle assumed to be w.r.t. (vertical) 'z' axis 
 



