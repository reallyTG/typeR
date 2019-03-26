library(BioGeoBEARS)


### Name: getAIC
### Title: Calculate AIC
### Aliases: getAIC

### ** Examples

LnL = -34.5
numparams = 2
getAIC(LnL, numparams)

LnL = -20.9
numparams = 3
getAIC(LnL, numparams)

# It turns out to work on lists, also
LnL = c(-34.5, -20.9)
numparams = c(2, 3)
getAIC(LnL, numparams)



