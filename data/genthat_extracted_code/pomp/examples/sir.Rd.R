library(pomp)


### Name: sir
### Title: Compartmental epidemiological models
### Aliases: euler.sir gillespie.sir bbs
### Keywords: datasets models

### ** Examples

pompExample(euler.sir)
plot(euler.sir)
plot(simulate(euler.sir,seed=20348585))
coef(euler.sir)

pompExample(gillespie.sir)
plot(gillespie.sir)
plot(simulate(window(gillespie.sir,end=3),seed=20348585))
coef(gillespie.sir)

pompExample(bbs)
plot(bbs)
coef(bbs)



