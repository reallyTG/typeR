library(baytrends)


### Name: detrended.flow
### Title: Create Seasonally Detrended Flow Data Set
### Aliases: detrended.flow

### ** Examples

## Not run: 
##D # Define Function Inputs
##D usgsGageID    <- c("01491000", "01578310")
##D siteName      <- c("Choptank River near Greensboro, MD",
##D                    "Susquehanna River at Conowingo, MD")
##D yearStart     <- 1983
##D yearEnd       <- 2016
##D dvAvgWinSel   <- c(1, 5, 10, 15, 20, 30, 40, 50, 60, 90, 120, 150, 180, 210)
##D dvAvgWgtSel   <- "uniform"
##D dvAvgSidesSel <- 1
##D lowess.f      <- 0.2
##D                  
##D # Run Function
##D flow.detrended <- detrended.flow(usgsGageID, siteName, yearStart, yearEnd
##D                                 , dvAvgWinSel, dvAvgWgtSel, dvAvgSidesSel
##D                                , lowess.f)
## End(Not run)



