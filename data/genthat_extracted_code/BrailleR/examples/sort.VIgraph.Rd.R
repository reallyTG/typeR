library(BrailleR)


### Name: sort.VIgraph
### Title: Sort VI.ggplot points list
### Aliases: sort.VIgraph

### ** Examples

if (require(ggplot2)) {
    sort(VI(qplot(x=1:5, y=c(2,5,1,4,3))), decreasing=TRUE, by="y")
}



