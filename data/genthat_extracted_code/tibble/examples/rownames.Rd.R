library(tibble)


### Name: rownames
### Title: Tools for working with row names
### Aliases: rownames has_rownames remove_rownames rownames_to_column
###   rowid_to_column column_to_rownames

### ** Examples

has_rownames(mtcars)
has_rownames(iris)
has_rownames(remove_rownames(mtcars))

head(rownames_to_column(mtcars))

mtcars_tbl <- as_tibble(rownames_to_column(mtcars))
mtcars_tbl
head(column_to_rownames(mtcars_tbl))



