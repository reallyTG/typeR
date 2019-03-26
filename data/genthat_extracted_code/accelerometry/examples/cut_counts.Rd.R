library(accelerometry)


### Name: cut_counts
### Title: Cut Count Values into Intensity Ranges
### Aliases: cut_counts

### ** Examples

# Load accelerometer data for first 5 participants in NHANES 2003-2004
data(unidata)

# Get data from ID number 21005
counts.part1 <- unidata[unidata[, "seqn"] == 21005, "paxinten"]

# Cut into 5 intensity levels and plot
intensity.part1 <- cut_counts(counts = counts.part1)
plot(intensity.part1)





