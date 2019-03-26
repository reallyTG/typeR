library(questionr)


### Name: prop
### Title: Global percentages of a two-way frequency table.
### Aliases: prop prop_table prop.data.frame prop.matrix prop.tabyl

### ** Examples

## Sample table
data(Titanic)
tab <- apply(Titanic, c(1,4), sum)
## Percentages
prop(tab)
## Percentages with custom display
prop(tab, digits=2, percent=TRUE, total=FALSE, n=TRUE)



