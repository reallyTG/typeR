library(PowerNormal)


### Name: pn.ICred
### Title: Credibility interval for alpha (PN distribution)
### Aliases: pn.ICred

### ** Examples


x <- rpn(100, 25)

pn.ICred(x, 0.95)

pn.ICred(x, 0.95, prior = 'Uniform')

pn.ICred(x, 0.95, prior = 'Gamma', 1/100, 1/100)




