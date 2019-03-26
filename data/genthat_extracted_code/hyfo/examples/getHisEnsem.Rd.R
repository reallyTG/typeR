library(hyfo)


### Name: getHisEnsem
### Title: Get ensemble forecast from historical data.
### Aliases: getHisEnsem

### ** Examples


data(testdl)

a <- testdl[[1]]

# Choose example from "1994-2-4" to "1996-1-4"
b <- getHisEnsem(a, example = c('1994-2-4', '1996-1-4'))

# Default interval is one year, can be set to other values, check help for information.

# Take 7 months as interval
b <- getHisEnsem(a, example = c('1994-2-4', '1996-1-4'), interval = 210, plot = 'cum') 
# Take 30 days as buffer
b <- getHisEnsem(a, example = c('1994-2-4', '1996-1-4'), interval = 210, buffer = 30)


# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/





