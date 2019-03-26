library(smbinning)


### Name: smbinning.gen
### Title: Utility to generate a new characteristic from a numeric variable
### Aliases: smbinning.gen

### ** Examples

# Load library and its dataset
library(smbinning) # Load package and its data
pop=smbsimdf1 # Set population
train=subset(pop,rnd<=0.7) # Training sample

# Binning application for a numeric variable
result=smbinning(df=train,y="fgood",x="dep") # Run and save result

# Generate a dataset with binned characteristic
pop=smbinning.gen(pop,result,"g1dep")

# Check new field counts
table(pop$g1dep)



