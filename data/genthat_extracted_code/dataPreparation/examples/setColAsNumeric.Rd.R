library(dataPreparation)


### Name: setColAsNumeric
### Title: Set columns as numeric
### Aliases: setColAsNumeric

### ** Examples

# Build a fake data.table
dataSet <- data.frame(charCol1 = c("1", "2", "3"), 
						 charCol2 = c("4", "5", "6"))

# Set charCol1 and charCol2 as numeric
dataSet <- setColAsNumeric(dataSet, cols = c("charCol1", "charCol2"))

# Using strip string when spaces or wrong decimal separator is used
dataSet <- data.frame(charCol1 = c("1", "2", "3"), 
                      charCol2 = c("4, 1", "5, 2", "6, 3"))

# Set charCol1 and charCol2 as numeric
setColAsNumeric(dataSet, cols = c("charCol1", "charCol2")) 
# generate mistakes
setColAsNumeric(dataSet, cols = c("charCol1", "charCol2"), stripString = TRUE) 
# Doesn't generate any mistake (but is a bit slower)



