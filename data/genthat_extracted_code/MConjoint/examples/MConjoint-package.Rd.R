library(MConjoint)


### Name: MConjoint-package
### Title: Perform Conjoint Analysis using multiple designs
### Aliases: MConjoint-package MConjoint
### Keywords: package

### ** Examples

#  A simple conjoint problem.  Managers can make hiring descisions
#  based on the factors
#  University: Prestige, Excellent, Good; Sex: Male, Female;
#  Dress: smart, messy; Hair: long, short.
#  We want to determine the importance of these factors.
#  We interview two managers.  The first picks first by
#  University, then by sex, male over female, then
#  by dress, smart over messy, and does not care about hair
#  length.  The second is like the first except that
#  this manager picks female over male.

# start with the full factorial design

data(hire.candidates)

#get a questionaire

hire.questionaire = mc.get.initial.design(hire.candidates,max.trials=10)

#collect the data

data(hire.data)

#get a design pack for the analyis

hire.despack=mc.good.designs(hire.questionaire$design, size=20)

#do the conjoint analysis

hire.despack=M.Conjoint(hire.despack,hire.data)

# (note this illustrates the danger of averaging utilities.
# The average utility for both Male and Female is small, but
# Sex is important to both managers)



