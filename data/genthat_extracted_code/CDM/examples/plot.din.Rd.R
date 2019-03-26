library(CDM)


### Name: plot.din
### Title: Plot Method for Objects of Class din
### Aliases: plot.din
### Keywords: methods print

### ** Examples

##
## (1) examples based on dataset fractions.subtraction.data
##

data(fraction.subtraction.data)
data(fraction.subtraction.qmatrix)

## Fix the guessing parameters of items 5, 8 and 9 equal to .20
# define a constraint.guess matrix
constraint.guess <-  matrix(c(5,8,9, rep(0.2, 3)), ncol=2)
fractions.dina.fixed <- CDM::din(data=fraction.subtraction.data,
  q.matrix=fraction.subtraction.qmatrix,
  constraint.guess=constraint.guess)

## The second plot shows the expected (MAP) and observed skill
## probabilities. The third plot visualizes the skill class
## occurrence probabilities; Only the 'top.n.skill.classes' most frequent
## skill classes are labeled; it is obvious that the skill class '11111111'
## (all skills are mastered) is the most probable in this population.
## The fourth plot shows the skill probabilities conditional on response
## patterns; in this population the skills 3 and 6 seem to be
## mastered easier than the others. The fifth plot shows the
## skill probabilities conditional on a specified response
## pattern; it is shown whether a skill is mastered (above
## .5+'uncertainty') unclassifiable (within the boundaries) or
## not mastered (below .5-'uncertainty'). In this case, the
## 527th respondent was chosen; if no response pattern is
## specified, the plot will not be shown (of course)
pattern <- paste(fraction.subtraction.data[527, ], collapse="")
plot(fractions.dina.fixed, pattern=pattern, display.nr=4)

# It is also possible to input a vector of item responses
plot(fractions.dina.fixed, pattern=fraction.subtraction.data[527, ],display.nr=4)

#uncertainty=0.1, top.n.skill.classes=6 are default
plot(fractions.dina.fixed, uncertainty=0.1, top.n.skill.classes=6,
  pattern=pattern)



