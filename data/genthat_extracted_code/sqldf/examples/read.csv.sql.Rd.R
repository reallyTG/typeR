library(sqldf)


### Name: read.csv.sql
### Title: Read File Filtered by SQL
### Aliases: read.csv.sql read.csv2.sql
### Keywords: manip

### ** Examples

## Not run: 
##D # might need to specify eol= too depending on your system
##D write.csv(iris, "iris.csv", quote = FALSE, row.names = FALSE)
##D iris2 <- read.csv.sql("iris.csv", 
##D 	sql = "select * from file where Species = 'setosa' ")
##D 
## End(Not run)



