library(hier.part)


### Name: all.regs
### Title: Goodness of Fit Measures for a Regression Hierarchy
### Aliases: all.regs
### Keywords: regression

### ** Examples

    #linear regression of log(electrical conductivity) in streams
    #against seven independent variables describing catchment
    #characteristics (from Hatt et al. 2004).

    data(urbanwq)
    env <- urbanwq[,2:8]
    all.regs(urbanwq$lec, env, fam = "gaussian", gof = "Rsqu",
             print.vars = TRUE)

    #logistic regression of an amphipod species occurrence in
    #streams against four independent variables describing
    #catchment characteristics (from Walsh et al. 2004).

    data(amphipod)
    env1 <- amphipod[,2:5]
    all.regs(amphipod$australis, env1, fam = "binomial",
             gof = "logLik", print.vars = TRUE)



