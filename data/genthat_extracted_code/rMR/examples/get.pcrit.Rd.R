library(rMR)


### Name: get.pcrit
### Title: Calculate Critical Tension for Rate Processes
### Aliases: get.pcrit

### ** Examples

## set data ##
data(fishMR)

## create time variable in POSIXct format ##
fishMR$std.time <- as.POSIXct(fishMR$Date.time,
                    format = "%d/%m/%Y %I:%M:%S %p")
                    
Pcrit1 <-get.pcrit(data = fishMR, DO.var.name = "DO.mgL",
                    Pcrit.below = 2,
                    time.var = "std.time",
                    time.interval = 120,
                    start.time = "2015-07-03 06:15:00",
                    stop.time = "2015-07-03 08:05:00")
## MR units in mgO2 / sec
            
## Change time interval ##
Pcrit2 <-get.pcrit(data = fishMR, DO.var.name = "DO.mgL",
                    Pcrit.below = 2,
                    time.var = "std.time",
                    time.interval = 60,
                    start.time = "2015-07-03 06:15:00",
                    stop.time = "2015-07-03 08:05:00",
                    time.units = "min")
## MR units in mgO2 / min


Pcrit3 <-get.pcrit(data = fishMR, DO.var.name = "DO.mgL",
                    Pcrit.below = 2,
                    time.var = "std.time",
                    time.interval = 60,
                    start.time = "2015-07-03 06:15:00",
                    stop.time = "2015-07-03 08:05:00",
                    time.units = "hr",
                    ylab = "Met Rate (mg O2 L-1 hr-1)")
## MR units in mgO2 / hr

## syst vol specified at 0.75 L ##

Pcrit3a <-get.pcrit(data = fishMR, DO.var.name = "DO.mgL",
                    Pcrit.below = 2,
                    time.var = "std.time",
                    time.interval = 60,
                    start.time = "2015-07-03 06:15:00",
                    stop.time = "2015-07-03 08:05:00",
                    time.units = "hr",
                    syst.vol = 0.75,
                    ylab = "Met Rate (mg O2 / hr)")
## MR units in mgO2 / hr

## No vertical lines on plot

Pcrit4 <-get.pcrit(data = fishMR, DO.var.name = "DO.mgL",
                    Pcrit.below = 2,
                    time.var = "std.time",
                    time.interval = 60,
                    start.time = "2015-07-03 06:15:00",
                    stop.time = "2015-07-03 08:05:00",
                    time.units = "hr",
                    ylab = "Met Rate (mg O2 L-1 hr-1)",
                    Pcrit.type = "")
                    




