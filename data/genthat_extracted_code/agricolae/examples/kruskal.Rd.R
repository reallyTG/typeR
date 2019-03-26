library(agricolae)


### Name: kruskal
### Title: Kruskal Wallis test and multiple comparison of treatments.
### Aliases: kruskal
### Keywords: nonparametric

### ** Examples

library(agricolae)
data(corn)
str(corn)
comparison<-with(corn,kruskal(observation,method,group=TRUE, main="corn"))
comparison<-with(corn,kruskal(observation,method,p.adj="bon",group=FALSE, main="corn"))



