library(hier.part)


### Name: partition
### Title: Hierarchical Partitioning from a List of Goodness of Fit
###   Measures
### Aliases: partition

### ** Examples

    #linear regression of log(electrical conductivity) in streams
    #against seven independent variables describing catchment
    #characteristics (from Hatt et al. 2004).

    data(urbanwq)
    env <- urbanwq[,2:8]
    gofs <- all.regs(urbanwq$lec, env, fam = "gaussian",
    gof = "Rsqu", print.vars = TRUE)
    partition(gofs, pcan = 7, var.names = names(urbanwq[,2,8]))

    #hierarchical partitioning of logistic and linear regression
    #goodness of fit measures from Chevan and Sutherland (1991).

    data(chevan)
    partition(chevan$chisq, pcan = 4)
    partition(chevan$rsqu, pcan = 4)



