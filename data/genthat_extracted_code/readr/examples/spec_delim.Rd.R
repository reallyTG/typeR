library(readr)


### Name: spec_delim
### Title: Generate a column specification
### Aliases: spec_delim spec_csv spec_csv2 spec_tsv spec_table spec_table2

### ** Examples

# Input sources -------------------------------------------------------------
# Retrieve specs from a path
spec_csv(system.file("extdata/mtcars.csv", package = "readr"))
spec_csv(system.file("extdata/mtcars.csv.zip", package = "readr"))

# Or directly from a string (must contain a newline)
spec_csv("x,y\n1,2\n3,4")

# Column types --------------------------------------------------------------
# By default, readr guesses the columns types, looking at the first 1000 rows.
# You can specify the number of rows used with guess_max.
spec_csv(system.file("extdata/mtcars.csv", package = "readr"), guess_max = 20)



