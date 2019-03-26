library(openintro)


### Name: WriteTable
### Title: Write a Data Frame or Matrix to a Text File
### Aliases: WriteTable

### ** Examples

## Not run: 
##D ## To write a CSV file for input to Excel one might use
##D x <- data.frame(a = I("a \" quote"), b = pi)
##D WriteTable(x, file = "foo.csv", sep = ",", col.names = NA,
##D            qmethod = "double")
##D ## and to read this file back into R one needs
##D read.table("foo.csv", header = TRUE, sep = ",", row.names = 1)
##D ## NB: you do need to specify a separator if qmethod = "double".
## End(Not run)



