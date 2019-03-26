library(tmod)


### Name: showGene
### Title: A combined beeswarm / boxplot
### Aliases: showGene

### ** Examples

data(Egambia)
E <- as.matrix(Egambia[,-c(1:3)])
showGene(E["20799",], rep(c("CTRL", "TB"), each=15))



