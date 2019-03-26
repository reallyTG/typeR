library(accelerometry)


### Name: weartime
### Title: Wear Time Classification
### Aliases: weartime

### ** Examples

# Load accelerometer data for first 5 participants in NHANES 2003-2004
data(unidata)

# Get data from ID number 21005
counts.part1 <- unidata[unidata[, "seqn"] == 21005, "paxinten"]

# Identify periods of valid wear time
weartime.flag <- weartime(counts = counts.part1)





