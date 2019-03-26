library(readBrukerFlexData)


### Name: .double2singlePrecision
### Title: Converts double to single precision.
### Aliases: .double2singlePrecision
### Keywords: internal

### ** Examples

## load library
library("readBrukerFlexData")

## show more details
oldDigits <- options()$digits
options(digits=22)

## a test number
num <- 1/3

num
readBrukerFlexData:::.double2singlePrecision(num)

## reset digits option
options(digits=oldDigits)




