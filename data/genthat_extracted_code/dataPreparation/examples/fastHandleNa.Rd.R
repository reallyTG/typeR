library(dataPreparation)


### Name: fastHandleNa
### Title: Handle NA values
### Aliases: fastHandleNa

### ** Examples

# Build a useful dataSet set for example
require(data.table)
dataSet <- data.table(numCol = c(1, 2, 3, NA),
                   charCol = c("", "a", NA, "c"),
                   booleanCol = c(TRUE, NA, FALSE, NA))

# To set NAs to 0, FALSE and "" (respectively for numeric, logical, character)
fastHandleNa(copy(dataSet))

# In a numeric column to set NAs as "missing"
fastHandleNa(copy(dataSet), set_char = "missing")

# In a numeric column, to set NAs to the minimum value of the column#'                    
fastHandleNa(copy(dataSet), set_num = min) # Won't work because min(c(1, NA)) = NA so put back NA
fastHandleNa(copy(dataSet), set_num = function(x)min(x,na.rm = TRUE)) # Now we handle NAs

# In a numeric column, to set NAs to the share of NAs values
rateNA <- function(x){sum(is.na(x)) / length(x)}
fastHandleNa(copy(dataSet), set_num = rateNA) 




