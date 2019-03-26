library(dataPreparation)


### Name: fastIsEqual
### Title: Fast checks of equality
### Aliases: fastIsEqual

### ** Examples

# Test on a character
fastIsEqual("a", "a")
fastIsEqual("a", "b")

# Test on a vector
myVector <- rep(x = "a", 10000)
fastIsEqual(myVector, myVector)

# Test on a data.table
fastIsEqual(messy_adult, messy_adult)



