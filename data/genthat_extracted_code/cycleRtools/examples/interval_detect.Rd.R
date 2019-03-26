library(cycleRtools)


### Name: interval_detect
### Title: Detect Intervals in a Ride.
### Aliases: interval_detect

### ** Examples

data(intervaldata)

## "intervaldata" is a ride that includes two efforts (2 & 5 minutes) and a cafe
## stop. The efforts are marked in the lap column, which we can use as a
## criterion.

with(intervaldata, tapply(X = delta.t, INDEX = lap, sum)) / 60  # Minutes.

## The above shows the efforts were laps two and four. What was the power?
with(intervaldata, tapply(X = power.W, INDEX = lap, mean))[c(2, 4)]

## And for the sake of example, some other summary metrics...
l <- split(intervaldata, intervaldata$lap)
names(l) <- paste("Lap", names(l))  # Pretty names.
vapply(l, FUN.VALUE = numeric(3), FUN = function(x)
  c(t.min = ride_time(x$timer.s) / 60, NP = NP(x), TSS = TSS(x)))

## Could we have gotten the same information without the lap column?
## Two efforts and a cafe stop == 7 sections.
interval_detect(intervaldata, sections = 7, plot = TRUE)

## An overzealous start to the first effort is being treated as a seperate section,
## so let's allow for an extra section...
interval_detect(intervaldata, sections = 8, plot = TRUE)

## Looks okay, so save the output and combine the second and third sections.
intervaldata$intv <- interval_detect(intervaldata, sections = 8, plot = FALSE)
intervaldata$intv[intervaldata$intv == 3] <- 2

## Are the timings as expected?
with(intervaldata, tapply(X = delta.t, INDEX = intv, sum)) / 60  # Minutes.

## Close enough!

i <- split(intervaldata, intervaldata$intv)
names(i) <- paste("Interval", seq_along(i))  # Pretty names.
toplot <- vapply(i, FUN.VALUE = numeric(3), FUN = function(x)
  c(t.min = ride_time(x$timer.s) / 60, NP = NP(x), TSS = TSS(x)))

print(toplot)

par(mfrow = c(3, 1))
mapply(function(r, ylab) barplot(
  toplot[r, c(1:3, 5:7)], names.arg = seq_along(toplot[r, c(1:3, 5:7)]),
  xlab = "Section", ylab = ylab),
  r = 1:3, ylab = c("Ride time (minutes)", "NP", "TSS"))




