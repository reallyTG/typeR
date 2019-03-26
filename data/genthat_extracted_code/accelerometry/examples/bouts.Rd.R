library(accelerometry)


### Name: bouts
### Title: Physical Activity Bout Detection
### Aliases: bouts

### ** Examples

# Load accelerometer data for first 5 participants in NHANES 2003-2004
data(unidata)

# Get data from ID number 21005
counts.part1 <- unidata[unidata[, "seqn"] == 21005, "paxinten"]

# Identify periods of valid wear time
wear.part1 <- weartime(counts = counts.part1)

# Identify moderate-to-vigorous activity bouts
mvpa.bouts <- bouts(counts = counts.part1, weartime = wear.part1, 
                    thresh_lower = 2020)





