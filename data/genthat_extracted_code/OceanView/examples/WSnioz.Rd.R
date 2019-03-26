library(OceanView)


### Name: NIOZ Westerschelde monitoring
### Title: NIOZ monitoring data of Westerschelde estuary.
### Aliases: WSnioz WSnioz.table
### Keywords: datasets

### ** Examples

# save plotting parameters
 pm <- par("mfrow")
 mar <- par("mar")
   
## =============================================================================
## Show stations and measured variables
## =============================================================================  
 unique(WSnioz[,c("Station", "Latitude", "Longitude")])
 unique(WSnioz[,c("VariableName", "VariableDesc")])
                                  
## =============================================================================
## An image for Nitrate:
## =============================================================================

# 1. use db2cross to make a cross table of the nitrate data
# assume that samples that were taken within 5 days belong to the same
# monitoring campaign (df.row).

 NO3 <- db2cross(WSnioz, row = "SamplingDateTimeREAL", 
       col = "Station", val = "DataValue", 
       subset = (VariableName == "WNO3"), df.row = 5)

# 2. plot the list using image2D; increase resolution
 image2D(NO3, resfac = 3)   

## =============================================================================
## All timeseries for one station
## =============================================================================

 st1 <- db2cross(WSnioz, row = "SamplingDateTimeREAL", 
       col = "VariableName", val = "DataValue", 
       subset = (WSnioz$Station == 1), df.row = 5)

 Mplot(cbind(st1$x/365+1900,st1$z))

## =============================================================================
## All timeseries for multiple stations
## =============================================================================

 dat <- NULL
 for (st in 1:17) {
   dd <- db2cross(WSnioz, row = "SamplingDateTimeREAL", 
          col = "VariableName", val = "DataValue", 
          subset = (WSnioz$Station == st), df.row = 5)
   dat <- rbind(dat,  cbind(st, time = dd$x/365+1900, dd$z))
 }

# select data for station 1, 17
 dat2 <- Msplit(dat, split = "st", subset = st %in% c(1, 17))
 names(dat2)
  
 Mplot(dat2, lty = 1)

## =============================================================================
## tabular format of the same data
## =============================================================================
 head(WSnioz.table)

# plot all data from station 1:
 Mplot(WSnioz.table, select = 3:11, subset = Station == 1, legend = FALSE)

 Mplot(Msplit(WSnioz.table, "Station", subset = Station %in% c(1, 13)) , 
   select = c("WNO3", "WNO2", "WNH4", "WO2"), lty = 1, lwd = 2,
   xlab = "Daynr", log = c("y", "y", "y", ""), 
   legend = list(x = "left", title = "Station")) 



# reset plotting parameters
 par(mar = mar)
 par(mfrow = pm)



