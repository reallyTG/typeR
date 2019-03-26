library(survival)


### Name: solder
### Title: Data from a soldering experiment
### Aliases: solder
### Keywords: datasets

### ** Examples

data(solder)
# The balanced subset used by Chambers and Hastie
#   contains the first 180 of each mask and deletes mask A6. 
index <- 1 + (1:nrow(solder)) - match(solder$Mask, solder$Mask)
solder.balance <- droplevels(subset(solder, Mask != "A6" & index <= 180))



