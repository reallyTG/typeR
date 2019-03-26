library(vcdExtra)


### Name: Crossings
### Title: Crossings Interaction of Factors
### Aliases: Crossings
### Keywords: models manip

### ** Examples

data(Hauser79)
# display table
structable(~Father+Son, data=Hauser79)

hauser.indep <- gnm(Freq ~ Father + Son, data=Hauser79, family=poisson)
hauser.CR <- update(hauser.indep, ~ . + Crossings(Father,Son))
LRstats(hauser.CR)

hauser.CRdiag <- update(hauser.indep, ~ . + Crossings(Father,Son) + Diag(Father,Son))
LRstats(hauser.CRdiag)




