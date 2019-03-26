library(iemisc)


### Name: na.interp1
### Title: na.interp1
### Aliases: na.interp1

### ** Examples

library(iemisc)

# zoo time series example
zoo1 <- structure(c(1.6, 1.7, 1.7, 1.7, 1.7, 1.7, 1.6, 1.7, 1.7, 1.7,
1.7, 1.7, 2, 2.1, 2.1, NA, NA, 2.1, 2.1, NA, 2.3, NA, 2, 2.1), .Dim = c(12L,
2L), .Dimnames = list(NULL, c("V1", "V2")), index = structure(c(1395242100,
1395243000, 1395243900, 1395244800, 1395245700, 1395256500, 1395257400,
1395258300, 1395259200, 1395260100, 1395261000, 1395261900), class =
c("POSIXct", "POSIXt"), tzone = "GMT"), class = "zoo")

zoo1 <- as.data.frame(zoo1) # to data.frame from zoo
zoo1[, "Time"] <- as.POSIXct(rownames(zoo1)) # create column named Time as a
# POSIXct class
zoo1 <- setDT(zoo1) # create data.table out of data.frame
setcolorder(zoo1, c(3, 1, 2)) # set the column order as the 3rd column
# followed by the 2nd and 1st columns
zoo1 <- setDF(zoo1) # return to data.frame

rowsinterps1 <- which(is.na(zoo1$V2 == TRUE))
# index of rows of zoo1 that have NA (to be interpolated)
xi <- as.numeric(zoo1[which(is.na(zoo1$V2 == TRUE)), 1])
# the Date-Times for V2 to be interpolated in numeric format
interps1 <- na.interp1(as.numeric(zoo1$Time), zoo1$V2, xi = xi,
na.rm = FALSE, maxgap = 1)
# the interpolated values where only gap sizes of 1 are filled
zoo1[rowsinterps1, 3] <- interps1
# replace the NAs in V2 with the interpolated V2 values
zoo1



# data frame time series example
df1 <- structure(list(Time = structure(c(1395242100, 1395243000, 1395243900,
 1395244800, 1395245700, 1395256500, 1395257400, 1395258300, 1395259200,
 1395260100, 1395261000, 1395261900), class = c("POSIXct", "POSIXt"),
 tzone = "GMT"), V1 = c(1.6, 1.7, 1.7, 1.7, 1.7, 1.7, 1.6, 1.7, 1.7, 1.7,
 1.7, 1.7), V2 = c(2, 2.1, 2.1, NA, NA, 2.1, 2.1, NA, 2.3, NA, 2, 2.1)),
 .Names = c("Time", "V1", "V2"), row.names = c(NA, -12L),
 class = "data.frame")

rowsinterps1 <- which(is.na(df1$V2 == TRUE))
# index of rows of df1 that have NA (to be interpolated)
xi <- as.numeric(df1[which(is.na(df1$V2 == TRUE)), 1])
# the Date-Times for V2 to be interpolated in numeric format
interps1 <- na.interp1(as.numeric(df1$Time), df1$V2, xi = xi,
 na.rm = FALSE, maxgap = 1)
# the interpolated values where only gap sizes of 1 are filled
df1[rowsinterps1, 3] <- interps1
# replace the NAs in V2 with the interpolated V2 values
df1



# data.table time series example
dt1 <- structure(list(Time = structure(c(1395242100, 1395243000, 1395243900,
 1395244800, 1395245700, 1395256500, 1395257400, 1395258300, 1395259200,
 1395260100, 1395261000, 1395261900), class = c("POSIXct", "POSIXt"),
 tzone = "GMT"), V1 = c(1.6, 1.7, 1.7, 1.7, 1.7, 1.7, 1.6, 1.7, 1.7, 1.7,
 1.7, 1.7), V2 = c(2, 2.1, 2.1, NA, NA, 2.1, 2.1, NA, 2.3, NA, 2, 2.1)),
 .Names = c("Time", "V1", "V2"), row.names = c(NA, -12L), class =
 c("data.table", "data.frame"), sorted = "Time")

rowsinterps2 <- which(is.na(dt1[, 3, with = FALSE] == TRUE))
# index of rows of x that have NA (to be interpolated)
xi <- as.numeric(dt1[rowsinterps2, Time])
# the Date-Times for V2 to be interpolated in numeric format
interps2 <- dt1[, na.interp1(as.numeric(Time), V2, xi = xi,
 na.rm = FALSE, maxgap = 1)]
# the interpolated values where only gap sizes of 1 are filled
dt1[rowsinterps2, `:=` (V2 = interps2)]
# replace the NAs in V2 with the interpolated V2 values
dt1





