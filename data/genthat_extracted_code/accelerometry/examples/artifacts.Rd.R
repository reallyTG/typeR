library(accelerometry)


### Name: artifacts
### Title: Accelerometer Artifact Correction
### Aliases: artifacts

### ** Examples

# Load accelerometer data for first 5 participants in NHANES 2003-2004
data(unidata)

# Get data from ID number 21007
counts.part3 <- unidata[unidata[, "seqn"] == 21007, "paxinten"]

# Replace counts > 10,000 with average of neighboring values
counts.part3.corrected <- artifacts(counts = counts.part3, thresh = 10000)




