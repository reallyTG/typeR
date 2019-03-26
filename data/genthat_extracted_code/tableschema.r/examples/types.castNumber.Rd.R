library(tableschema.r)


### Name: types.castNumber
### Title: Cast numbers of any kind including decimals
### Aliases: types.castNumber

### ** Examples


types.castNumber(format = "default", value = 1)
types.castNumber(format = "default", value = "1.0")

# cast number with  percent sign
types.castNumber(format = "default", value = "10.5%", options = list(bareNumber = FALSE))

# cast number with comma group character
types.castNumber(format = "default", value = "1,000", options = list(groupChar = ','))
types.castNumber(format = "default", value = "10,000.50", options = list(groupChar = ','))

# cast number with "#" group character and "&" as decimal character
types.castNumber(format = "default", value = "10#000&50", 
options = list(groupChar = '#', decimalChar = '&'))




