library(rgr)


### Name: gx.sort
### Title: Function to Single Column Sort a Matrix or Data Frame
### Aliases: gx.sort
### Keywords: misc arith

### ** Examples

## Make test data available
data(sind)
attach(sind)

## Sort data frame sind into ascending order on the value
## of column 4, Zn
gx.sort(sind, 4)

## Sort data frame sind into descending order on the value
## of column 4, Zn
gx.sort(sind, 4, reverse = TRUE)

## Sort only the geochemical data in data frame sind into
## descending order on the value of column 4, Zn.  Note
## that sind[, -c(1:3)] moves the old column 4 to
## position 1
gx.sort(sind[, -c(1:3)], 1, reverse = TRUE)

## Detach test data
detach(sind)



