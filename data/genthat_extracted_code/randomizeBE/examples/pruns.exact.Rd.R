library(randomizeBE)


### Name: pruns.exact
### Title: Exact cumulative distribution function of runs test
### Aliases: pruns.exact

### ** Examples

# SPSS "Exact Tests": small sample example, exact p:  0.071
# x <- c(1, 1, 1, 1, 0, 0, 0, 0, 1, 1)  
pruns.exact(r=3, n1=4, n2=6)
# 0.07142857
# left tail P(R<=3)=0.04761905
pruns.exact(r=3, n1=4, n2=6, tail="lower")
# right tail P(R>=3)=0.9904762
pruns.exact(r=3, n1=4, n2=6, tail="upper")
# or via runs.pvalue (2-sided)
x <- c(1, 1, 1, 1, 0, 0, 0, 0, 1, 1)  
runs.pvalue(x, pmethod="ex")



