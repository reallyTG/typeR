library(questionr)


### Name: cprop
### Title: Column percentages of a two-way frequency table.
### Aliases: cprop cprop.table cprop.data.frame cprop.matrix cprop.tabyl

### ** Examples

## Sample table
data(Titanic)
tab <- apply(Titanic, c(4,1), sum)
## Column percentages
cprop(tab)
## Column percentages with custom display
cprop(tab, digits=2, percent=TRUE, total=FALSE)



