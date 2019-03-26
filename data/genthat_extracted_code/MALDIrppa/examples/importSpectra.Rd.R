library(MALDIrppa)


### Name: importSpectra
### Title: Convert mass spectra from text files into 'MassSpectrum' objects
### Aliases: importSpectra
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Create fake mass spectrometry data

s1 <- cbind(1:20, rlnorm(20))
s2 <- cbind(1:20, rlnorm(20))
s3 <- cbind(1:20, rlnorm(20))


current <- getwd()
dir.create(paste(getwd(),"/example",sep=""))
setwd(paste(getwd(),"/example",sep=""))

write.table(s1, file="s1.csv", row.names = FALSE, col.names = FALSE, sep=" ")
write.table(s2, file="s2.csv", row.names = FALSE, col.names = FALSE, sep=" ")
write.table(s3, file="s3.csv", row.names = FALSE, col.names = FALSE, sep=" ")

# Import files in ~/example and arrange into a list of MassSpectrum objects

spectra <- importSpectra()

# Delete example folder and back to original working directory
unlink(getwd(),recursive = TRUE)
setwd(current)



