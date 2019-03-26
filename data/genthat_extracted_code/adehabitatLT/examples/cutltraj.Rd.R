library(adehabitatLT)


### Name: cutltraj
### Title: Split Trajectories into Several Bursts
### Aliases: cutltraj bindltraj
### Keywords: programming

### ** Examples

## Not run: 
##D #######################################################
##D ##
##D ## GPS monitoring of one bear
##D 
##D data(bear)
##D 
##D ## We want to study the trajectory of the day at the scale
##D ## of the day. We define one trajectory per day. The trajectory should begin
##D ## at 22H00
##D ## The following function returns TRUE if the date is comprised between
##D ## 21H00 and 22H00 (i.e. correspond to the relocation taken at 21H30)
##D 
##D foo <- function(date) {
##D      da <- as.POSIXlt(date, "UTC")
##D      ho <- da$hour + da$min/60
##D      return(ho>21&ho<22)
##D }
##D 
##D ## We cut the trajectory into bursts after the relocation taken at 21H30:
##D 
##D bea1 <- cutltraj(bear, "foo(date)", nextr = TRUE)
##D bea1
##D 
##D ## Remove the first and last burst:
##D bea2 <- bea1[-c(1,length(bea1))]
##D 
##D 
##D #######################################################
##D ##
##D ## Bind the trajectories
##D 
##D bea3 <- bindltraj(bea2)
##D bea3
## End(Not run)



