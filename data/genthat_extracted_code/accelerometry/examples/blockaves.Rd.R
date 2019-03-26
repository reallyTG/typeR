library(accelerometry)


### Name: blockaves
### Title: Block Averages
### Aliases: blockaves

### ** Examples

# Load accelerometer data for first 5 participants in NHANES 2003-2004
data(unidata)

# Get data from ID number 21005, Saturday only
counts.sat <- unidata[unidata[, "seqn"] == 21005 & unidata[, "paxday"] == 7, 
                      "paxinten"]
                      
# Calculate and plot hourly count averages
hourly.averages <- blockaves(x = counts.sat, window = 60, integer = TRUE)
plot(hourly.averages)





