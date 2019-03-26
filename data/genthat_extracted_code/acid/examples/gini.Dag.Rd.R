library(acid)


### Name: gini.Dag
### Title: Gini Coefficient for the Dagum Distribution
### Aliases: gini.Dag

### ** Examples

a.test<- 4
b.test<- 20000
p.test<- 0.7
alpha.test<-1
GB2sample<-rGB2(10000,b.test,a.test,p.test,1)
gini.Dag(a.test,p.test)
gini(GB2sample)



