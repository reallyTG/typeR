library(dbplyr)


### Name: partial_eval
### Title: Partially evaluate an expression.
### Aliases: partial_eval
### Keywords: internal

### ** Examples

vars <- c("year", "id")
partial_eval(quote(year > 1980), vars = vars)

ids <- c("ansonca01", "forceda01", "mathebo01")
partial_eval(quote(id %in% ids), vars = vars)

# You can use local to disambiguate between local and remote
# variables: otherwise remote is always preferred
year <- 1980
partial_eval(quote(year > year), vars = vars)
partial_eval(quote(year > local(year)), vars = vars)

# Functions are always assumed to be remote. Use local to force evaluation
# in R.
f <- function(x) x + 1
partial_eval(quote(year > f(1980)), vars = vars)
partial_eval(quote(year > local(f(1980))), vars = vars)

# For testing you can also use it with the tbl omitted
partial_eval(quote(1 + 2 * 3))
x <- 1
partial_eval(quote(x ^ y))



