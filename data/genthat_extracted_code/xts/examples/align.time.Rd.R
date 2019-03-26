library(xts)


### Name: align.time
### Title: Align seconds, minutes, and hours to beginning of next period.
### Aliases: align.time align.time.xts adj.time shift.time
### Keywords: chron manip ts misc

### ** Examples

x <- Sys.time() + 1:1000

# every 10 seconds
align.time(x, 10)

# align to next whole minute
align.time(x, 60)

# align to next whole 10 min interval
align.time(x, 10 * 60)



