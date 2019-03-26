library(rMR)


### Name: MR.loops
### Title: Calculate Metabolic Rates from Multiple Closed Respirometry
###   Loops
### Aliases: MR.loops

### ** Examples

## load data ##
data(fishMR)

## create time variable in POSIXct format ##
fishMR$std.time <- as.POSIXct(fishMR$Date.time,
                    format = "%d/%m/%Y %I:%M:%S %p")

## calc background resp rate
bgd.resp <- 
    background.resp(fishMR, "DO.mgL", 
                    start.time = "2015-07-02 16:05:00",
                    end.time = "2015-07-02 16:35:00",
                    ylab = "DO (mg/L)", xlab = "time (min)")

bg.slope.a <- bgd.resp$mat[2]


starts <- c("2015-07-03 01:15:00", "2015-07-03 02:13:00",
            "2015-07-03 03:02:00", "2015-07-03 03:50:00",
            "2015-07-03 04:50:00")

stops <- c("2015-07-03 01:44:00", "2015-07-03 02:35:30",
           "2015-07-03 03:25:00", "2015-07-03 04:16:00",
           "2015-07-03 05:12:00")

metR <- MR.loops(data = fishMR, DO.var.name ="DO.mgL",
                 start.idx = starts, time.units = "hr",
                 stop.idx = stops, time.var.name = "std.time",
                 temp.C = "temp.C", elevation.m = 1180,
                 bar.press = NULL, in.DO.meas = "mg/L", 
                 background.consumption = bg.slope.a,
                 ylim=c(6, 8))

metR$MR.summary


## now lets assume we ran a control loop for background rate
## before and after we ran the MR loops
## let:

bg.slope.b <-bg.slope.a -0.0001 
metRa <- MR.loops(data = fishMR, DO.var.name ="DO.mgL",
                 start.idx = starts, time.units = "hr",
                 stop.idx = stops, time.var.name = "std.time",
                 temp.C = "temp.C", elevation.m = 1180,
                 bar.press = NULL, in.DO.meas = "mg/L", 
                 background.consumption = c(bg.slope.a, bg.slope.b),
                 background.indices = c("2015-07-02 16:20:00",
                                        "2015-07-03 06:00:00"),
                 ylim=c(6, 8))


metRa$MR.summary

# note that the calculated slopes
# diverge as time increases. This is
# because the background respiration
# rate is increasing.

metR$MR.summary-metRa$MR.summary

## This looks great, but you need to check your start and
## stop vectors, otherwise, you could end up with some
## atrocious loops, e.g.:

starts <- c("2015-07-03 01:15:00", "2015-07-03 02:13:00",
            "2015-07-03 03:02:00", "2015-07-03 03:50:00",
            "2015-07-03 04:50:00")

stops <- c("2015-07-03 01:50:00", "2015-07-03 02:35:30",
           "2015-07-03 03:25:00", "2015-07-03 04:16:00",
           "2015-07-03 05:12:00")

metRb <- MR.loops(data = fishMR, DO.var.name ="DO.mgL",
         start.idx = starts,
         stop.idx = stops, time.var.name = "std.time",
         temp.C = "temp.C", elevation.m = 1180,
         bar.press = NULL, in.DO.meas = "mg/L", 
         background.consumption = bg.slope.a,
         ylim=c(6,8))




