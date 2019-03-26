library(VWPre)


### Name: recode_ia
### Title: Recode interest area IDs and/or interest area labels
### Aliases: recode_ia

### ** Examples

## Not run: 
##D library(VWPre)
##D # To recode both IDs and Labels...
##D df <- recode_ia(data=dat, IDs=c("234"="2", "0"="0", "35"="3", "11"="1", 
##D "4"="6666"), Labels=c(Outside="Outside", Target="NewTargName", 
##D Dist2="NewDist2Name", Comp="NewCompName", Dist1="NewDist1Name"))
##D  
##D # For a more complete tutorial on VWPre plotting functions:
##D vignette("SR_Interest_Areas", package="VWPre")
## End(Not run)




