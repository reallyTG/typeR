library(accelerometry)


### Name: intensities
### Title: Physical Activity Intensities
### Aliases: intensities

### ** Examples

# Load accelerometer data for first 5 participants in NHANES 2003-2004
data(unidata)

# Get data from ID number 21005
counts.part1 <- unidata[unidata[, "seqn"] == 21005, "paxinten"]

# Create vector of counts during valid wear time only
counts.part1.wear <- counts.part1[weartime(counts = counts.part1) == 1]

# Calculate physical activity intensity variables
intensity.variables <- intensities(counts = counts.part1.wear)





