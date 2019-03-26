library(vsgoftest)


### Name: vs.test
### Title: Vasicek-Song goodness-of-fit test for various distributions
### Aliases: vs.test
### Keywords: htest

### ** Examples

set.seed(1)
samp <- rnorm(50,2,3)
vs.test(x = samp, densfun = 'dnorm', param = c(2,3), B = 500) #Simple null hypothesis
vs.test(x = samp, densfun='dnorm', B = 500) #Composite null hypothesis
## Using asymptotic distribution to compute the p-value
vs.test(x = samp, densfun='dnorm', simulate.p.value = FALSE) #Composite null hypothesis




