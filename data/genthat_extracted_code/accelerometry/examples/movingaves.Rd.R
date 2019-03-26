library(accelerometry)


### Name: movingaves
### Title: Moving Averages
### Aliases: movingaves

### ** Examples

# Load accelerometer data for first 5 participants in NHANES 2003-2004
data(unidata)

# Get data from ID number 21005
id.part1 <- unidata[unidata[, "seqn"] == 21005, "seqn"]
counts.part1 <- unidata[unidata[, "seqn"] == 21005, "paxinten"]

# Create vector of all 10-minute moving averages
all.movingaves <- movingaves(x = counts.part1, window = 10, integer = TRUE)

# Calculate maximum 10-minute moving average
max.movingave <- movingaves(x = counts.part1, window = 10, integer = TRUE, 
                            max = TRUE)





