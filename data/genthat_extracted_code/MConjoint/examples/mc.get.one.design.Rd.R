library(MConjoint)


### Name: mc.get.one.design
### Title: mc.get.one.design
### Aliases: mc.get.one.design
### Keywords: multivariate

### ** Examples

data(hire.candidates)

#get a nine card design
mc.get.one.design(hire.candidates,9)

#get a 15 card design with cross correlations less that .1
mc.get.one.design(hire.candidates,15,tol=.1)




