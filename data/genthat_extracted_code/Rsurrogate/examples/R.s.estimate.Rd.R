library(Rsurrogate)


### Name: R.s.estimate
### Title: Calculates the proportion of treatment effect explained
### Aliases: R.s.estimate
### Keywords: regression models smooth robust nonparametric

### ** Examples

data(d_example)
names(d_example)
R.s.estimate(yone=d_example$y1, yzero=d_example$y0, sone=d_example$s1.a, szero=d_example$s0.a, 
number = "single", type = "robust")
R.s.estimate(yone=d_example$y1, yzero=d_example$y0, sone=cbind(d_example$s1.a,d_example$s1.b, 
d_example$s1.c), szero=cbind(d_example$s0.a, d_example$s0.b, d_example$s0.c), 
number = "multiple", type = "model")



