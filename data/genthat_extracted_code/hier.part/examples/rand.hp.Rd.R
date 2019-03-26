library(hier.part)


### Name: rand.hp
### Title: Randomization Test for Hierarchical Partitioning
### Aliases: rand.hp

### ** Examples

    #linear regression of log(electrical conductivity) in streams
    #against four independent variables describing catchment
    #characteristics (from Hatt et al. 2004).

    data(urbanwq)
    env <- urbanwq[,2:5]
    rand.hp(urbanwq$lec, env, fam = "gaussian", gof = "Rsqu")$Iprobs

    #logistic regression of an amphipod species occurrence in
    #streams against four independent variables describing
    #catchment characteristics (from Walsh et al. 2004).

    data(amphipod)
    env1 <- amphipod[,2:5]
    rand.hp(amphipod$australis, env1, fam = "binomial",
    gof = "logLik")$Iprobs



