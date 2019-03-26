library(hier.part)


### Name: hier.part
### Title: Goodness of Fit Calculation and Hierarchical Partitioning
### Aliases: hier.part
### Keywords: regression

### ** Examples

    #linear regression of log(electrical conductivity) in 
    #streams against seven independent variables 
    #describing catchment characteristics (from
    #Hatt et al. 2004)

    data(urbanwq)
    env <- urbanwq[,2:8]
    hier.part(urbanwq$lec, env, fam = "gaussian", gof = "Rsqu")

    #logistic regression of an amphipod species occurrence in
    #streams against four independent variables describing
    #catchment characteristics (from Walsh et al. 2004).

    data(amphipod)
    env1 <- amphipod[,2:5]
    hier.part(amphipod$australis, env1, fam = "binomial",
              gof = "logLik")



