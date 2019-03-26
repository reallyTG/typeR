library(reams)


### Name: bestmods
### Title: Find best submodels of a full linear model
### Aliases: bestmods

### ** Examples

data(swiss)
modtable = scoremods(swiss$Fertility, swiss[ , -1], nboot=100)

par(mfrow = 1:2)
bestmods(modtable)

# The predictor names may render the above table too wide to be 
# read easily.  To remove them, set names = 1:5 in the above call 
# to scoremods.  Alternatively, modify modtable as follows:
modtable.nonames = modtable
dimnames(modtable.nonames)[[2]][1:5] = 1:5
bestmods(modtable.nonames, main="Same, minus names")



