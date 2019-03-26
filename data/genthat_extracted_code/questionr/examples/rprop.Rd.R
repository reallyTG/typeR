library(questionr)


### Name: rprop
### Title: Row percentages of a two-way frequency table.
### Aliases: rprop lprop rprop.table rprop.data.frame rprop.matrix
###   rprop.tabyl

### ** Examples

## Sample table
data(Titanic)
tab <- apply(Titanic, c(1,4), sum)
## Column percentages
rprop(tab)
## Column percentages with custom display
rprop(tab, digits=2, percent=TRUE, total=FALSE)



