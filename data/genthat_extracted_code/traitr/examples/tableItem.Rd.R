library(traitr)


### Name: tableItem
### Title: List editor - list <-> tree, must have special structure to
###   list? XXX This needs writing An item to display a table of data
###   (given as a matrix or data.frame)
### Aliases: tableItem

### ** Examples

## to change data frame
i <- tableItem(mtcars, name="a")
i$set_a(mtcars[1:3, 1:3])



