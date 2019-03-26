library(DOS)


### Name: senU
### Title: Sensitivity Analysis for a New U Statistic
### Aliases: senU

### ** Examples

data("schoket")
d<-schoket$adductsw-schoket$adductsc

# With the defaults, m=2, m1=2, m2=2, the U-statistic is very
# similar to Wilcoxon's signed rank statistic
senWilcox(d,gamma=1)
senU(d,gamma=1)

# With m=1, m1=1, m2=1, the U-statistic is the sign test
senU(d,gamma=1,m=1,m1=1,m2=1)
prop.test(sum(d>0),length(d),p=.5,
     alternative="greater",correct=FALSE)$p.value

# With m=m1=m2, this is the test of Stephenson (1981) whose ranks are similar to
# those of Conover and Salzburg (1988); see Rosenbaum (2007).

# The calculations that follow reproduce the sensitivity analysis for the
# data of Schoket et al. () in Chapter 16 of Desgin of Observational Studies (2010).
senU(d,gamma=1,m=2,m1=2,m2=2)
senU(d,gamma=1,m=5,m1=5,m2=5)

senU(d,gamma=1.5,m=2,m1=2,m2=2)
senU(d,gamma=1.5,m=5,m1=5,m2=5)

senU(d,gamma=1.8,m=2,m1=2,m2=2)
senU(d,gamma=1.8,m=5,m1=5,m2=5)

senU(d,gamma=2,m=2,m1=2,m2=2)
senU(d,gamma=2,m=5,m1=5,m2=5)

data(lead)
# Reproduces parts of Table 2 in Rosenbaum (2011)
senU(lead$dif,gamma=5.8,m=8,m1=5,m2=8)
senU(lead$dif,gamma=5,m=5,m1=4,m2=5)

# m=2, m1=2, m2=2 is the U-statistic that closely
# resembles Wilcoxon's signed rank test.  Note
# that the results are almost the same.
senWilcox(lead$dif,gamma=5) # In Table 2
senU(lead$dif,gamma=5,m=2,m1=2,m2=2)



