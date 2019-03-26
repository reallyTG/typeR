library(rMR)


### Name: background.resp
### Title: Determine the Background Respiration in a Respirometer
### Aliases: background.resp

### ** Examples

##load data##
data(fishMR)

## create time variable in POSIXct format ##
fishMR$std.time <- as.POSIXct(fishMR$Date.time,
                    format = "%d/%m/%Y %I:%M:%S %p")

bgd.resp <- 
background.resp(fishMR, "DO.mgL", 
           start.time = "2015-07-02 16:05:00",
           end.time = "2015-07-02 16:35:00")



