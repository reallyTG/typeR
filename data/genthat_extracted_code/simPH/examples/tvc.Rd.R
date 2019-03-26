library(simPH)


### Name: tvc
### Title: Create a time interaction variable
### Aliases: tvc
### Keywords: utilities

### ** Examples

# Load Golub & Steunenberg (2007) Data
data('GolubEUPData')

# Subset PURELY TO SPEED UP THE EXAMPLE
GolubEUPData <- GolubEUPData[1:500, ]

# Expand data into equally spaced time intervals
GolubEUPData <- SurvExpand(GolubEUPData, GroupVar = 'caseno',
                  Time = 'begin', Time2 = 'end', event = 'event')

# Create natural log time interaction with the qmv variable
GolubEUPData$Lqmv <- tvc(GolubEUPData, b = 'qmv', tvar = 'end', tfun = 'log',
                         vector = TRUE)

# Create interactions for a vector of variables
BaseVars <- c('qmv', 'backlog', 'coop', 'codec', 'qmvpostsea', 'thatcher')

Test <- tvc(GolubEUPData, b = BaseVars, tvar = 'end', tfun = 'log')




