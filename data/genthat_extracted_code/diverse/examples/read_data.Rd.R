library(diverse)


### Name: read_data
### Title: A procedure to read data of a data file in formats csv, dta or
###   spss
### Aliases: read_data

### ** Examples

#reading an edges list or panel shape, source data must include three columns
path <-   system.file("extdata", "PantheonEdges.csv", package = "diverse")
sep <- ","
data <- read_data(path)
#reading a table
path  <- system.file("extdata", "PantheonMatrix.csv", package = "diverse")
sep <- ","
data <- read_data(path)
#reading a table which includes the entities in the columns
path <- system.file("extdata", "Geese.csv", package = "diverse")
data <- read_data(path, category_row=TRUE)



