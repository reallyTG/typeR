library(BayesCombo)


### Name: ev.combo
### Title: Calculates the posterior probability of hypotheses for multiple
###   studies
### Aliases: ev.combo

### ** Examples

x <- ev.combo(beta = c(0.0126, 5.0052, 1.2976, 0.0005),
       se.beta = c(0.050, 2.581, 2.054, 0.003) )
x
plot(x)



