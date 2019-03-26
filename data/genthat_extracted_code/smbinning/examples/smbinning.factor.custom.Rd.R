library(smbinning)


### Name: smbinning.factor.custom
### Title: Customized Binning on Factor Variables
### Aliases: smbinning.factor.custom

### ** Examples

# Load library and its dataset
library(smbinning) # Load package and its data

# Example: Customized binning for a factor variable
# Notation: Groups between double quotes
result=smbinning.factor.custom(
  smbsimdf1,x="inc",
  y="fgood",
  c("'W01','W02'",        # Group 1
    "'W03','W04','W05'",  # Group 2
    "'W06','W07'",        # Group 3
    "'W08','W09','W10'")) # Group 4
result$ivtable



