library(VARsignR)


### Name: fevdplot
### Title: Plotting variance decompositions with error bands from VAR
###   posterior draws
### Aliases: fevdplot
### Keywords: ts models

### ** Examples

## Not run: 
##D # Replication of Figure 5 of Uhlig (2005)
##D 
##D set.seed(12345)
##D data(uhligdata)
##D 
##D # variable labels for plots
##D vl <- c("GDP","GDP Deflator","Comm.Pr.Index","Fed Funds Rate",
##D         "NB Reserves", "Total Reserves")
##D 
##D # estimates the model
##D model0 <- rfbvar(Y=uhligdata, nlags=12, draws=1000, constant=FALSE,
##D                   steps=60, shock=4)
##D 
##D # get posterior draws
##D fevd0 <- model0$FEVDS
##D 
##D # plot impulse response functions
##D fevdplot(fevddraws=fevd0, type="median", labels=vl, save=FALSE, bands=c(0.16, 0.84),
##D         grid=TRUE, bw=FALSE)
##D 
## End(Not run)
 


