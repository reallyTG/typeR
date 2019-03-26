library(smbinning)


### Name: smbinning
### Title: Optimal Binning for Scoring Modeling
### Aliases: smbinning

### ** Examples

# Load library and its dataset
library(smbinning) # Load package and its data

# Example: Optimal binning
result=smbinning(df=smbsimdf1,y="fgood",x="cbs1") # Run and save result
result$ivtable # Tabulation and Information Value
result$iv # Information value
result$bands # Bins or bands
result$ctree # Decision tree



