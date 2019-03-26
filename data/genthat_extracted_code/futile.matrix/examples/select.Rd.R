library(futile.matrix)


### Name: select
### Title: Select a portion of a matrix based on a regular expression of
###   the row and/or column names.
### Aliases: select select<-

### ** Examples

library(datasets)
select(swiss, "Rive")

select(swiss, col.pat="E", fixed=TRUE)

select(swiss, row.pat='^[A-T]', col.pat="^E")

select(swiss, "Rive", "Ed") <- min(select(swiss, "^[^R]", "Ed"))



