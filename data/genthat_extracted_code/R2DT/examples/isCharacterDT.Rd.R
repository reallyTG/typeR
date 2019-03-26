library(R2DT)


### Name: isCharacterDT
### Title: Testing if a set of columns of a data.table object corresponds
###   to the character/string data type
### Aliases: isCharacterDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = rep(c(TRUE, FALSE), 5), y = LETTERS[1:10]))

isCharacterDT(inputDT)

inputDT2 <- as.data.table(data.frame(y = LETTERS[1:10]))

isCharacterDT(inputDT2)
## No test: 
isCharacterDT(inputDT2, c('x', 'y'))
## End(No test)
isCharacterDT(inputDT2, returnNames = TRUE)



