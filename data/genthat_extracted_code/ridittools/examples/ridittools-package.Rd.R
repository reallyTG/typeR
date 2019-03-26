library(ridittools)


### Name: ridittools-package
### Title: Useful Functions for Ridit Analysis
### Aliases: ridittools-package ridittools
### Keywords: package

### ** Examples

ref <- acc[ , 1]
toridit(ref)
g <- acc[ , 2]
meanridit(g, ref)
seridit(g, ref)
meanridits(flu.age, 2, "H3")
meanridits(flu.age, 2) # Uses group totals as reference
seridits(handgun, 2, 1)



