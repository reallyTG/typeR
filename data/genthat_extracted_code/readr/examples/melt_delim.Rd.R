library(readr)


### Name: melt_delim
### Title: Return melted data for each token in a delimited file (including
###   csv & tsv)
### Aliases: melt_delim melt_csv melt_csv2 melt_tsv

### ** Examples

# Input sources -------------------------------------------------------------
# Read from a path
melt_csv(readr_example("mtcars.csv"))
melt_csv(readr_example("mtcars.csv.zip"))
melt_csv(readr_example("mtcars.csv.bz2"))
## Not run: 
##D melt_csv("https://github.com/tidyverse/readr/raw/master/inst/extdata/mtcars.csv")
## End(Not run)

# Or directly from a string (must contain a newline)
melt_csv("x,y\n1,2\n3,4")

# To import empty cells as 'empty' rather than `NA`
melt_csv("x,y\n,NA,\"\",''", na = "NA")

# File types ----------------------------------------------------------------
melt_csv("a,b\n1.0,2.0")
melt_csv2("a;b\n1,0;2,0")
melt_tsv("a\tb\n1.0\t2.0")
melt_delim("a|b\n1.0|2.0", delim = "|")



