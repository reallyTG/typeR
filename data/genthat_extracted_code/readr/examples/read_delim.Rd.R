library(readr)


### Name: read_delim
### Title: Read a delimited file (including csv & tsv) into a tibble
### Aliases: read_delim read_csv read_csv2 read_tsv

### ** Examples

# Input sources -------------------------------------------------------------
# Read from a path
read_csv(readr_example("mtcars.csv"))
read_csv(readr_example("mtcars.csv.zip"))
read_csv(readr_example("mtcars.csv.bz2"))

## Not run: 
##D # Including remote paths
##D read_csv("https://github.com/tidyverse/readr/raw/master/inst/extdata/mtcars.csv")
## End(Not run)

# Or directly from a string (must contain a newline)
read_csv("x,y\n1,2\n3,4")

# Column types --------------------------------------------------------------
# By default, readr guesses the columns types, looking at the first 1000 rows.
# You can override with a compact specification:
read_csv("x,y\n1,2\n3,4", col_types = "dc")

# Or with a list of column types:
read_csv("x,y\n1,2\n3,4", col_types = list(col_double(), col_character()))

# If there are parsing problems, you get a warning, and can extract
# more details with problems()
y <- read_csv("x\n1\n2\nb", col_types = list(col_double()))
y
problems(y)

# File types ----------------------------------------------------------------
read_csv("a,b\n1.0,2.0")
read_csv2("a;b\n1,0;2,0")
read_tsv("a\tb\n1.0\t2.0")
read_delim("a|b\n1.0|2.0", delim = "|")



