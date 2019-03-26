library(PortfolioAnalytics)


### Name: group_constraint
### Title: constructor for group_constraint
### Aliases: group_constraint

### ** Examples

data(edhec)
ret <- edhec[, 1:4]

pspec <- portfolio.spec(assets=colnames(ret))

# Assets 1 and 3 are groupA
# Assets 2 and 4 are groupB
pspec <- add.constraint(portfolio=pspec, 
                        type="group", 
                        groups=list(groupA=c(1, 3),
                                    groupB=c(2, 4)),
                        group_min=c(0.15, 0.25),
                        group_max=c(0.65, 0.55))

# 2 levels of grouping (e.g. by sector and geography)
pspec <- portfolio.spec(assets=5)
# Assets 1, 3, and 5 are Tech
# Assets 2 and 4 are Oil
# Assets 2, 4, and 5 are UK
# Assets 1 and are are US
group_list <- list(group1=c(1, 3, 5),
                   group2=c(2, 4),
                   groupA=c(2, 4, 5),
                   groupB=c(1, 3))

pspec <- add.constraint(portfolio=pspec, 
                        type="group", 
                        groups=group_list,
                        group_min=c(0.15, 0.25, 0.2, 0.1),
                        group_max=c(0.65, 0.55, 0.5, 0.4))
                        



