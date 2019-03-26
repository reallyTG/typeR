library(MConjoint)


### Name: mc.add.to.design
### Title: Add cards to a design
### Aliases: mc.add.to.design mc.add.to.design.fast
### Keywords: multivariate

### ** Examples

data(hire.candidates)
base.design = mc.get.one.design(hire.candidates, 9)

#use defaults, (except max.trials=10 for speed)

mc.add.to.design(hire.candidates,base.design, max.trials=10)

#add 4 cards, accepting cross corellations up to .35
#warning, this may take several minutes

#mc.add.to.design(hire.candidates,base.design,4,tol=.35)

# you can speed this up and in this case
# have almost as many good designs (53 vs.54)

#mc.add.to.design(hire.candidates,base.design,4,tol=.35,max.trials=10)





