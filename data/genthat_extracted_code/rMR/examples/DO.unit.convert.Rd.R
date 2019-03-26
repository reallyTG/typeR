library(rMR)


### Name: DO.unit.convert
### Title: Convert Between Different Common Units of DO Concentration
### Aliases: DO.unit.convert

### ** Examples

## on a single value ##

DO.pct<- DO.unit.convert(x= 125.6863, DO.units.in = "PP",
                DO.units.out = "pct",
                bar.units.in = "mmHg", bar.press = 750, temp.C =15)

## Apply to a column in a 'data.frame' class object ## 

## load data ##
data(fishMR)

## create time variable in POSIXct format ##
fishMR$std.time <- as.POSIXct(fishMR$Date.time,
                    format = "%d/%m/%Y %I:%M:%S %p")

head(fishMR)

#note that DO data are in mg/L (DO.mgL) and
#that there is an instantaneous temperature column
#(temp.C) and a pressure column (Bar.Pressure.hpa)

DO.pct.col.a <- DO.unit.convert(fishMR$DO.mgL, DO.units.in = "mg/L",
                DO.units.out = "pct",
                bar.units.in = "kpa", bar.press = 101.3,
                temp.C = fishMR$temp.C,
                bar.units.out = "kpa")
DO.pct.col.b<- DO.unit.convert(fishMR$DO.mgL, DO.units.in = "mg/L",
                DO.units.out = "pct",
                bar.units.in = "kpa", bar.press = 101.3,
                temp.C = fishMR$temp.C)
head(DO.pct.col.a)
head(DO.pct.col.b)

# Now with df #

fishMR2 <- as.data.frame(cbind(fishMR, DO.pct.col.a))

par(mfrow = c(1,2))
plotRaw(data = fishMR, DO.var.name = "DO.mgL",
          start.time = "2015-07-03 06:15:00",
          end.time = "2015-07-03 08:05:00",
          main = "DO (mg/L) vs time",
          xlab = "time",
          ylab = "DO (mg/L)")
          

plotRaw(data = fishMR2, DO.var.name = "DO.pct.col.a",
          start.time = "2015-07-03 06:15:00",
          end.time = "2015-07-03 08:05:00",
          main = "DO (percent saturation) vs time",
          xlab = "time",
          ylab = "DO (percent saturation)")



