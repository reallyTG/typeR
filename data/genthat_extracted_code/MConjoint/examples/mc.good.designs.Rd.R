library(MConjoint)


### Name: mc.good.designs
### Title: mc.good.design
### Aliases: mc.good.designs
### Keywords: multivariate

### ** Examples


data(hire.questionaire)


#default
mc.good.designs(hire.questionaire$design)

#look for 7 card designs, with the cross correlation tolerance increased to .3

#mc.good.designs(hire.questionaire$design,7,tol=.3)






