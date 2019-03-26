library(dataMaid)


### Name: isKey
### Title: Check if a variable qualifies as a key
### Aliases: isKey

### ** Examples

keyVar <- c("a", "b", "c", "d", "e", "f")
notKeyVar <- c("a", "a", "b", "c", "d", "e", "f")

isKey(keyVar)
isKey(notKeyVar)




