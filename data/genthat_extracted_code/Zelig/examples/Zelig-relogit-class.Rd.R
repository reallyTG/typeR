library(Zelig)


### Name: Zelig-relogit-class
### Title: Rare Events Logistic Regression for Dichotomous Dependent
###   Variables
### Aliases: Zelig-relogit-class zrelogit

### ** Examples

library(Zelig)
data(mid)
z.out1 <- zelig(conflict ~ major + contig + power + maxdem + mindem + years,
              data = mid, model = "relogit", tau = 1042/303772)
summary(z.out1)




