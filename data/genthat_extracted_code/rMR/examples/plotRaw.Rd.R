library(rMR)


### Name: plotRaw
### Title: Plotting Data from Witrox
### Aliases: plotRaw

### ** Examples

## load data ##

data(fishMR)
## create time variable in POSIXct format ##
fishMR$std.time <- as.POSIXct(fishMR$Date.time,
                    format = "%d/%m/%Y %I:%M:%S %p")

plotRaw(data = fishMR, DO.var.name = "DO.mgL",
         start.time = "2015-07-03 06:15:00",
         end.time = "2015-07-03 08:05:00")
         
plotRaw(fishMR, DO.var.name = "DO.mgL",
         start.time = "2015-07-03 01:00:00",
         end.time = "2015-07-03 05:12:00")




