library(psych)


### Name: fa.random
### Title: A first approximation to Random Effects Exploratory Factor
###   Analysis
### Aliases: fa.random
### Keywords: multivariate models

### ** Examples

fa.ab <- fa(ability,4,rotate="none")  #normal factor analysis
fa.ab.ip <- fa.random(ability,3,rotate="none") 
fa.congruence(list(fa.ab,fa.ab.ip,fa.ab.ip$within.r))


  


