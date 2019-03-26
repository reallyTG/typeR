library(MRH)


### Name: FindBinWidth
### Title: A pre-processing function that calculates the length of time per
###   bin for different values of M.
### Aliases: FindBinWidth

### ** Examples

# Examine the options for the NCCTG lung cancer data set (from the survival package)
data(cancer)

# Code the censoring variable delta as 0/1 instead of 1/2
cancer$censorvar = cancer$status - 1

# The time unit in the cancer data set is in days, so specify time.unit as "d". 
FindBinWidth(cancer$time, cancer$censorvar, time.unit = 'd')

# None of the bin options show an optimal/rounded length.  
# Set maxStudyTime to 960.  This will show the results if we use 8 bins, with 120 days per bin.
FindBinWidth(cancer$time, cancer$censorvar, time.unit = 'd', maxStudyTime = 8*120)

# Results show rounded bin lengths, and we see that with the shortened maximum study time
# zero extra failures are censored.



