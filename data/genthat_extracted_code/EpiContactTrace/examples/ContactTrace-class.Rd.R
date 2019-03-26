library(EpiContactTrace)


### Name: ContactTrace-class
### Title: Class '"ContactTrace"'
### Aliases: ContactTrace-class
### Keywords: classes

### ** Examples


## Load data
data(transfers)

## Perform contact tracing
contactTrace <- Trace(movements = transfers,
                      root = 2645,
                      tEnd = '2005-10-31',
                      days = 90)

## Show structure
str(contactTrace)



