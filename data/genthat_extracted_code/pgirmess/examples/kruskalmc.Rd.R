library(pgirmess)


### Name: kruskalmc
### Title: Multiple comparison test after Kruskal-Wallis
### Aliases: kruskalmc kruskalmc.default kruskalmc.formula
### Keywords: htest

### ** Examples

resp<-c(0.44,0.44,0.54,0.32,0.21,0.28,0.7,0.77,0.48,0.64,0.71,0.75,0.8,0.76,0.34,0.80,0.73,0.8)
categ<-as.factor(rep(c("A","B","C"),times=1,each=6))
kruskalmc(resp, categ)
kruskalmc(resp, categ, probs=0.01)
kruskalmc(resp, categ, cont="one-tailed")
kruskalmc(resp, categ, cont="two-tailed")

kruskalmc(resp~categ)
kruskalmc(resp~categ, probs=0.01)
kruskalmc(resp~categ, cont="one-tailed")
kruskalmc(resp~categ, cont="two-tailed")



