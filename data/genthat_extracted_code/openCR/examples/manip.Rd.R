library(openCR)


### Name: miscellaneous
### Title: Data Manipulation
### Aliases: primarysessions secondarysessions
### Keywords: manip

### ** Examples


int <- intervals(join(ovenCH))
primary <- primarysessions(int)
primary

# number of secondary sessions per primary
table(primary) 

# secondary session numbers
secondarysessions(int)




