library(prop.comb.RR)


### Name: summary.prop.comb
### Title: Summary for a prop.comb object
### Aliases: summary.prop.comb

### ** Examples

# One proportion
A <-prop.comb(x=16, n=109, alternative="two.sided", conf.level=0.95)
summary(A)

# Difference of proportions
B <-prop.comb(x=c(83,69), n=c(88,76), alternative="two.sided", conf.level=0.95)
summary(B)

# Linear combination of two proportions
C <-prop.comb(x=c(44, 3), n=c(54, 58), a=c(-0.4, 0.6), alternative="two.sided", conf.level=0.95)
summary(C)

D <-prop.comb(x=c(32, 34), n=c(107, 92), a=c(107/199, 92/199), alternative="two.sided", 
conf.level=0.95)
summary(D)

# Linear combination of k>2 proportions
E <-prop.comb(x=c(73,32,44,34,104), n=c(158,107,175,92,143), 
a=c(158/675,107/675,175/675,92/675,143/675))
summary(E)



