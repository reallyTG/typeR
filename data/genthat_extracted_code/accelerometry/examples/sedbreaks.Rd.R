library(accelerometry)


### Name: sedbreaks
### Title: Sedentary Breaks
### Aliases: sedbreaks

### ** Examples

# Load accelerometer data for first 5 participants in NHANES 2003-2004
data(unidata)

# Get data from ID number 21005
id.part1 <- unidata[unidata[, "seqn"] == 21005, "seqn"]
counts.part1 <- unidata[unidata[, "seqn"] == 21005, "paxinten"]

# Identify periods of valid wear time
wear.part1 <- weartime(counts = counts.part1)

# Count number of sedentary breaks (over full week)
n.sedbreaks <- sedbreaks(counts = counts.part1, weartime = wear.part1)

# Flag sedentary breaks
sedbreaks.flagged <- sedbreaks(counts = counts.part1, weartime = wear.part1, 
                               flags = TRUE)





