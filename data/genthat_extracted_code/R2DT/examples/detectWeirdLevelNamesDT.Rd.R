library(R2DT)


### Name: detectWeirdLevelNamesDT
### Title: Detecting which levels of which factor of a data.table object
###   contain non-alpha numeric characters (including whitespace)
###   characters
### Aliases: detectWeirdLevelNamesDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = seq(1, 20, 2)))
detectWeirdLevelNamesDT(inputDT)

inputDT <- as.data.table(data.frame(x = seq(1, 20, 2), y = LETTERS[1:10]))
detectWeirdLevelNamesDT(inputDT)

inputDT <- as.data.table(data.frame(x = c(rep('test_', 5), rep('test@', 5)),
y = c(rep('test_', 5), rep('test@', 5))))
## No test: 
detectWeirdLevelNamesDT(inputDT)
## End(No test)



