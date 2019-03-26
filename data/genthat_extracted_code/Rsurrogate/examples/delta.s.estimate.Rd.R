library(Rsurrogate)


### Name: delta.s.estimate
### Title: Calculates model-based or robust residual treatment effect
### Aliases: delta.s.estimate
### Keywords: regression models smooth robust nonparametric

### ** Examples

data(d_example)
names(d_example)
delta.s.estimate(yone=d_example$y1, yzero=d_example$y0, sone=d_example$s1.a, szero=
d_example$s0.a, number = "single", type = "robust")
delta.s.estimate(yone=d_example$y1, yzero=d_example$y0, sone=d_example$s1.a, szero=
d_example$s0.a, number = "single", type = "model")
delta.s.estimate(yone=d_example$y1, yzero=d_example$y0, sone=cbind(d_example$s1.a, 
d_example$s1.b, d_example$s1.c), szero=cbind(d_example$s0.a, d_example$s0.b, d_example$s0.c), 
number = "multiple", type = "robust")
delta.s.estimate(yone=d_example$y1, yzero=d_example$y0, sone=cbind(d_example$s1.a, 
d_example$s1.b, d_example$s1.c), szero=cbind(d_example$s0.a, d_example$s0.b, d_example$s0.c),
number = "multiple", type = "model")



