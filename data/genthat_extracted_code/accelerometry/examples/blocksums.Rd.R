library(accelerometry)


### Name: blocksums
### Title: Block Sums
### Aliases: blocksums

### ** Examples

# Load accelerometer data for first 5 participants in NHANES 2003-2004
data(unidata)

# Get data from ID number 21005, Saturday only
counts.sat <- unidata[unidata[, "seqn"] == 21005 & unidata[, "paxday"] == 7, 
                      "paxinten"]
                      
# Calculate and plot hourly count sums
hourly.sums <- blocksums(x = counts.sat, window = 60, integer = TRUE)
plot(hourly.sums)





