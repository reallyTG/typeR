library(RoughSets)


### Name: SF.read.DecisionTable
### Title: Reading tabular data from files.
### Aliases: SF.read.DecisionTable

### ** Examples

#############################################################
## Example 1: data set saved in a file
#############################################################
## Let us assume we have the following data which has been already saved to the file "tes.dat"
data <- data.frame(c(0.12, 0.23, 0.24), c(1,3,2), c(10, 12, 18), c("a", "a", "b"), c(1, 1, 2))
## Not run: 
##D write.table(data, file = "tes.dat", row.names = FALSE, col.names = FALSE,
##D                     fileEncoding ="")
## End(Not run)

## Then we would generate decision table from tes.dat file.
## in this case, we want to define that second and third attributes are nominal and continuous,
## respectively.
## Not run: 
##D decision.table <- SF.read.DecisionTable(filename = "tes.dat", decision.attr = 5,
##D                   indx.nominal = c(2, 5), sep= " ", col.names = c("v1", "v2", "v3", "v4", "o1"))
## End(Not run)



