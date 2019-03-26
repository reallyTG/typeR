library(shock)


### Name: shockSelect
### Title: Shock selection
### Aliases: shockSelect

### ** Examples


## load data to test 
data(dataTest)

## dimension of the dataset expdata
n <- dim(dataTest)[1]
p <- dim(dataTest)[2]

## perform partition of variables selection
## based on the slope heuristic
resShock <- shockSelect(dataTest)




