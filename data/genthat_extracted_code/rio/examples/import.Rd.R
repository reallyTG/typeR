library(rio)


### Name: import
### Title: Import
### Aliases: import

### ** Examples

# create CSV to import
export(iris, "iris1.csv")

# specify `format` to override default format
export(iris, "iris.tsv", format = "csv")
stopifnot(identical(import("iris1.csv"), import("iris.tsv", format = "csv")))

# import CSV as a `data.table`
stopifnot(inherits(import("iris1.csv", setclass = "data.table"), "data.table"))
stopifnot(inherits(import("iris1.csv", setclass = "data.table"), "data.table"))

# pass arguments to underlying import function
iris1 <- import("iris1.csv")
identical(names(iris), names(iris1))

export(iris, "iris2.csv", col.names = FALSE)
iris2 <- import("iris2.csv")
identical(names(iris), names(iris2))

# set class for the response data.frame as "tbl_df" (from dplyr)
stopifnot(inherits(import("iris1.csv", setclass = "tbl_df"), "tbl_df"))

# cleanup
unlink("iris.tsv")
unlink("iris1.csv")
unlink("iris2.csv")




