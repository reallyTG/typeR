library(ruv)


### Name: replicate.matrix
### Title: Replicate (Mapping) Matrix
### Aliases: replicate.matrix

### ** Examples

# Define patientID and sampleDate
patientID = paste("patient", rep(1:4, each=6), sep="")
#print(patientID)
sampleDate = paste("June", rep(c(12,17,29), 8), sep="")
#print(sampleDate)
# Create a mapping matrix, where every unique 
# patientID / sampleDate combination define a set of replicates
M = replicate.matrix(data.frame(patientID, sampleDate))
#print(M)
# Convert M back to a factor
M = replicate.matrix(M, return.factor=TRUE)
#print(M)
# Create a factor for sampleDate, but burst the third date
temp = replicate.matrix(sampleDate, burst="June29", return.factor=TRUE)
#print(temp)
# Create a mapping matrix as described above in the description of return.factor
M = replicate.matrix(data.frame(temp, patientID))
#print(M)



