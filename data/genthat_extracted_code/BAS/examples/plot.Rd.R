library(BAS)


### Name: plot.bas
### Title: Plot Diagnostics for an BAS Object
### Aliases: plot.bas
### Keywords: regression

### ** Examples


data(Hald)
hald.gprior =  bas.lm(Y~ ., data=Hald, prior="g-prior", alpha=13,
                      modelprior=beta.binomial(1,1),
                      initprobs="eplogp")

plot(hald.gprior)





