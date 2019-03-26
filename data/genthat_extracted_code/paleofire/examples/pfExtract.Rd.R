library(paleofire)


### Name: pfExtract
### Title: Extract charcoal data for a list of sites
### Aliases: pfExtract

### ** Examples

## Not run: 
##D ## Retrieve a site
##D ID=pfSiteSel(site_name=="Pas-de-Fond")
##D ## Or a group of sites (Western North America)
##D ID=pfSiteSel(continent=="North America", long<(-100))
##D 
##D ## Extract data
##D A=pfExtract(ID)
##D 
##D # Plot the first site raw charcoal data
##D plot(A[A[,1]==ID$id_site[1],3],A[A[,1]==ID$id_site[1],4],type="l",main=ID$site_name[1],
##D      xlab="Age",ylab="raw Char")
## End(Not run)



