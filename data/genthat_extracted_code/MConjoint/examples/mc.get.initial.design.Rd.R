library(MConjoint)


### Name: mc.get.initial.design
### Title: mc.get.initial.design
### Aliases: mc.get.initial.design
### Keywords: multivariate

### ** Examples

data(hire.candidates)

#default except max.trials=10 for speed

hire.questionaire = mc.get.initial.design(hire.candidates,max.trials=10)

#A base design of 10 cards with 5 extra cards and good cross correlations less than .17
#takes about 10 seconds

#hire.questionaire = mc.get.initial.design(hire.candidates,cards=10,extra.cards=5,tol=.17)





