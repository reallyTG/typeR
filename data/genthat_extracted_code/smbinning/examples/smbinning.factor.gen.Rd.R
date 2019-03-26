library(smbinning)


### Name: smbinning.factor.gen
### Title: Utility to generate a new characteristic from a factor variable
### Aliases: smbinning.factor.gen

### ** Examples

# Load library and its dataset
library(smbinning) # Load package and its data
pop=smbsimdf1 # Set population
train=subset(pop,rnd<=0.7) # Training sample

# Binning a factor variable on training data
result=smbinning.factor(train,x="home",y="fgood")

# Example: Append new binned characteristic to population
pop=smbinning.factor.gen(pop,result,"g1home")

# Split training
train=subset(pop,rnd<=0.7) # Training sample

# Check new field counts
table(train$g1home)
table(pop$g1home)



