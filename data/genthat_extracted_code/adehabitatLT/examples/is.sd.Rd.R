library(adehabitatLT)


### Name: is.sd
### Title: Handling of Trajectories of the Same Duration
### Aliases: is.sd sd2df
### Keywords: programming

### ** Examples

## Not run: 
##D ## Takes the example from the help page of cutltraj (bear):
##D data(bear)
##D 
##D ## We want to study the trajectory of the animal at the scale
##D ## of the day. We define one trajectory per day. The trajectory should begin
##D ## at 22H00.
##D ## The following function returns TRUE if the date is comprised between
##D ## 21H00 and 22H00 and FALSE otherwise (i.e. correspond to the
##D ## relocation taken at 21H30)
##D 
##D foo <- function(date) {
##D      da <- as.POSIXlt(date, "UTC")
##D      ho <- da$hour + da$min/60
##D      return(ho>21.1&ho<21.9)
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
##D ## Is the resulting object "sd" ?
##D is.sd(bea2)
##D 
##D ## Converts to data frame:
##D df <- sd2df(bea2, "dist")
##D 
##D ## Plots the average distance per hour
##D meandi <- apply(df[-nrow(df),], 1, mean, na.rm = TRUE)
##D sedi <- apply(df[-nrow(df),], 1, sd, na.rm = TRUE) / sqrt(ncol(df))
##D plot(seq(0, 23.5, length = 47),
##D      meandi,
##D      ty = "b", pch = 16, xlab = "Hours (time 0 = 22H00)",
##D      ylab="Average distance covered by the bear in 30 mins",
##D      ylim=c(0, 500))
##D lines(seq(0, 23.5, length = 47),
##D       meandi+sedi, col="grey")
##D lines(seq(0, 23.5, length = 47),
##D       meandi-sedi, col="grey")
##D 
##D 
## End(Not run)



