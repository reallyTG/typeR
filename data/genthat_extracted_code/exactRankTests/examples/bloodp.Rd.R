library(exactRankTests)


### Name: bloodp
### Title: Diastolic Blood Pressure
### Aliases: bloodp
### Keywords: datasets

### ** Examples

data(bloodp)

# Permutation test

perm.test(bp ~ group, data=bloodp)
perm.test(bp ~ group, data=bloodp, alternative="greater")
perm.test(bp ~ group, data=bloodp, exact=FALSE)

# Wilcoxon-Mann-Whitney test

wilcox.exact(bp ~ group, data=bloodp, conf.int=TRUE, alternative="l")
wilcox.exact(bp ~ group, data=bloodp, conf.int=TRUE)

# compute the v.d. Waerden test

sc <- cscores(bloodp$bp, type="NormalQuantile")
X <- sum(sc[bloodp$group == "group2"])
round(pperm(X, sc, 11), 4) 
round(pperm(X, sc, 11, simulate=TRUE), 4)
round(pperm(X, sc, 11, alternative="two.sided"), 4) 
round(pperm(X, sc, 11, alternative="two.sided", simulate=TRUE), 4)

# use scores mapped into integers (cf. dperm)

sc <- cscores(bloodp$bp, type="NormalQuantile", int=TRUE)
X <- sum(sc[bloodp$group == "group2"])
round(pperm(X, sc, 11), 4)      
round(pperm(X, sc, 11, alternative="two.sided"), 4)




