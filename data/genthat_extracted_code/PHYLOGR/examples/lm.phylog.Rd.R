library(PHYLOGR)


### Name: lm.phylog
### Title: Linear Models from Simulated Data Sets
### Aliases: lm.phylog
### Keywords: models

### ** Examples

data(SimulExample)
ex1.lm <- lm.phylog(y ~ x1+diet, weights=x2, max.num=20,
                    exclude.tips=c("La","Ls"), data=SimulExample)
ex1.lm
summary(ex1.lm)
par(mfrow=c(2,2))
plot(ex1.lm)





