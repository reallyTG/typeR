library(ggm)


### Name: unmakeMG
### Title: Loopless mixed graphs components
### Aliases: unmakeMG
### Keywords: graphs ancestral graph mixed graph models multivariate

### ** Examples

ag <- makeMG(ug=UG(~y0*y1), dg=DAG(y4~y2, y2~y1), bg=UG(~y2*y3+y3*y4))  
isAG(ag)
unmakeMG(ag)



