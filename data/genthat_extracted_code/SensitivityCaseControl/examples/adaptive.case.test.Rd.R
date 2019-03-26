library(SensitivityCaseControl)


### Name: adaptive.case.test
### Title: Adaptive sensitivity analysis for case-control studies
### Aliases: adaptive.case.test

### ** Examples

# Adaptive test based on Table 4 in Small, Cheng, Halloran and Rosenbaum (2013)
no.exposed.in.matched.set=c(rep(0,229),rep(1,23),rep(1,51),rep(2,9),rep(0,373),rep(1,46),rep(1,50),
rep(2,13));
narrowcase=c(rep(1,312),rep(0,482));
case.exposed=c(rep(0,229),rep(0,23),rep(1,51),rep(1,9),rep(0,373),rep(0,46),rep(1,50),rep(1,13));
size.matched.set=rep(2,length(case.exposed))
# Test using the statistics T1 and T1+T2 where T1 is Mantel-Haenszel for narrow cases and T2 is 
# Mantel Haenszel for marginal cases
adaptive.case.test(no.exposed.in.matched.set,narrowcase,case.exposed,size.matched.set,Gamma=1.37,
alpha=.05,narrowmultiplier=1)
# Test using the statistics T1 and 2*T1+T2
adaptive.case.test(no.exposed.in.matched.set,narrowcase,case.exposed,size.matched.set,Gamma=1.37,
alpha=.05,narrowmultiplier=2)

# An example of an adaptive test in which narrow cases are matched to two controls and marginal 
# cases to one control
#      Narrow Cases                    Marginal Cases
# Referents Exposed  0   1   2         0     1   
# Case
# Not Exposed        40  10   6        50    20  
# Exposed            30  14   8        40    30
no.exposed.in.matched.set=c(rep(0,40),rep(1,10),rep(2,6),rep(1,30),rep(2,14),rep(3,8),rep(0,50),
rep(1,20),rep(1,40),rep(2,30))
narrowcase=c(rep(1,40+10+6+30+14+8),rep(0,50+20+40+30))
case.exposed=c(rep(0,40+10+6),rep(1,30+14+8),rep(0,50+20),rep(1,40+30))
size.matched.set=c(rep(3,40+10+6+30+14+8),rep(2,50+20+40+30))
adaptive.case.test(no.exposed.in.matched.set,narrowcase,case.exposed,size.matched.set,Gamma=1.2,
alpha=.05)







