library(DoE.base)


### Name: GRind
### Title: Functions for calculating generalized resolution, average
###   R-squared values and squared canonical correlations, and for checking
###   design regularity
### Aliases: GR GRind print.GRind SCFTs
### Keywords: design array

### ** Examples

   oa24.bad <- oa.design(L24.2.13.3.1.4.1, columns=c(1,2,14,15))
   oa24.good <- oa.design(L24.2.13.3.1.4.1, columns=c(3,10,14,15))
   ## generalized resolution differs (resolution is III in both cases)
   GR(oa24.bad)
   GR(oa24.good)

   ## and analogously also GRind and ARFT and SCFT
   GRind(oa24.bad)
   GRind(oa24.good)

   ## SCFTs
   ## Not run: 
##D plan <- L24.2.12.12.1[,c(1:5,13)]
##D    GRind(plan)  ## looks regular (0/1 SCFT only)
##D    SCFTs(plan)
##D    SCFTs(plan, resk.only=FALSE)
##D    
## End(Not run)



