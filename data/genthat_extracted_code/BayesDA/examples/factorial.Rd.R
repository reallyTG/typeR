library(BayesDA)


### Name: factorial
### Title: Data From a Chemical Experiment
### Aliases: factorial
### Keywords: datasets

### ** Examples

data(factorial)
summary(factorial)
# non-Bayesian analysis:
fac.mod1 <- lm(conversion ~ temperature+ratio+contact+
                            I(temperature*ratio)+I(temperature*contact)+
                            I(ratio*contact)+I(temperature^2)+I(ratio^2)+I(contact^2), 
                  data=factorial)
summary(fac.mod1)



