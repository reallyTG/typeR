library(paleofire)


### Name: pfTransform
### Title: Transform charcoal data for unique to multiple series
### Aliases: pfTransform

### ** Examples

## Not run: 
##D ## Select the site Pas-de-Fond
##D ID=pfSiteSel(site_name=="Pas-de-Fond")
##D 
##D # Transform data sequentially using pfTransform function
##D tr=pfTransform(ID,method=c("MinMax","Box-Cox"))
##D 
##D ## Plot transformed data for the first site
##D plot(tr$Age[,1],tr$TransData[,1],type="l")
## End(Not run)




