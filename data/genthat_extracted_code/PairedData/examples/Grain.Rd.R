library(PairedData)


### Name: Grain
### Title: Grain data from Preece (1982, Table 5)
### Aliases: Grain
### Keywords: datasets

### ** Examples

data(Grain)

# Usual visualization for paired data (2 clusters?)
with(Grain, plot(paired(GreatNorthern,BigFour)))

# Are they actually "adjacent" plots? 
# Why this variable Year?
# Is there any time trend?
with(Grain, plot(Year,GreatNorthern,type="o"))
with(Grain, plot(Year,BigFour,type="o"))




