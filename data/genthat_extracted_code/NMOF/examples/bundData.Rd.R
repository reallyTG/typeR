library(NMOF)


### Name: bundData
### Title: German Government Bond Data
### Aliases: bundData
### Keywords: datasets

### ** Examples

bundData
str(bundData)

## get ISINs of bonds
names(bundData$cfList)

## get a specific bond
thisBond <- "DE0001135358"
data.frame(dates = as.Date(bundData$tmList[[thisBond]]),
           payments = bundData$cfList[[thisBond]])



