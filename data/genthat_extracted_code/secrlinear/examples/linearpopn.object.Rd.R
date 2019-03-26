library(secrlinear)


### Name: linearpopn.object
### Title: Description of Linear Population Objects
### Aliases: linearpopn
### Keywords: S3class

### ** Examples


glymepop <- sim.linearpopn(glymemask, 30)
plot(glymepop, jitter=1)

CH <- sim.capthist(traps(arvicola), glymepop, detectpar = list(g0 = 0.4,
    sigma = 40), noccasions = 6, userdist = networkdistance)

plot(glymemask)
plot(CH, add = TRUE, tracks = TRUE)




