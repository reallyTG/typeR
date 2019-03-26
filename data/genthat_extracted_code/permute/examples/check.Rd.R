library(permute)


### Name: check
### Title: Utility functions for permutation schemes
### Aliases: check print.check print.summary.check summary.check
### Keywords: utilities design methods

### ** Examples

## only run this example if vegan is available
if (suppressPackageStartupMessages(require("vegan"))) {
    ## use example data from ?pyrifos in package vegan
    example(pyrifos)

    ## Demonstrate the maximum number of permutations for the pyrifos data
    ## under a series of permutation schemes

    ## no restrictions - lots of perms
    CONTROL <- how(within = Within(type = "free"))
    (check1 <- check(pyrifos, CONTROL))
    ## summary(check1)
    
    ## no strata but data are series with no mirroring, so 132 permutations
    CONTROL <- how(within = Within(type = "series", mirror = FALSE))
    check(pyrifos, CONTROL)
    
    ## no strata but data are series with mirroring, so 264 permutations
    CONTROL <- how(within = Within(type = "series", mirror = TRUE))
    check(pyrifos, control = CONTROL)
    
    ## unrestricted within strata
    check(pyrifos, control = how(plots = Plots(strata = ditch),
                   within = Within(type = "free")))
    
    ## time series within strata, no mirroring
    check(pyrifos,
          control = how(plots = Plots(strata = ditch),
          within = Within(type = "series", mirror = FALSE)))
    
    ## time series within strata, with mirroring
    check(pyrifos,
          control = how(plots = Plots(strata = ditch),
          within = Within(type = "series", mirror = TRUE)))
    
    ## time series within strata, no mirroring, same permutation
    ## within strata
    check(pyrifos,
          control = how(plots = Plots(strata = ditch),
          within = Within(type = "series", constant = TRUE)))
    
    ## time series within strata, with mirroring, same permutation
    ## within strata
    check(pyrifos,
          control = how(plots = Plots(strata = ditch),
          within = Within(type = "series", mirror = TRUE,
          constant = TRUE)))
    ## permute strata
    check(pyrifos, how(plots = Plots(strata = ditch, type = "free"),
                       within = Within(type = "none")))
}
    
## this should also also for arbitrary vectors
vec1 <- check(1:100)
vec2 <- check(1:100, how())
all.equal(vec1, vec2)
vec3 <- check(1:100, how(within = Within(type = "series")))
all.equal(100, vec3$n)
vec4 <- check(1:100, how(within = Within(type= "series", mirror = TRUE)))
all.equal(vec4$n, 200)

## enumerate all possible permutations
fac <- gl(2,6)
ctrl <- how(plots = Plots(strata = fac),
            within = Within(type = "grid", mirror = FALSE,
                            constant = TRUE, nrow = 3, ncol = 2))
check(1:12, ctrl)

numPerms(1:12, control = ctrl)
(tmp <- allPerms(12, control = update(ctrl, observed = TRUE)))
(tmp2 <- allPerms(12, control = ctrl))

## turn on mirroring
ctrl <- update(ctrl, within = update(getWithin(ctrl), mirror = TRUE))
numPerms(1:12, control = ctrl)
(tmp3 <- allPerms(12, control = update(ctrl, observed = TRUE)))
(tmp4 <- allPerms(12, control = ctrl))
## prints out details of the permutation scheme as
## well as the matrix of permutations
summary(tmp)
summary(tmp2)

## different numbers of observations per level of strata
fac <- factor(rep(1:3, times = c(3,2,2)))
## free permutations in levels of strata
numPerms(7, how(within = Within(type = "free"),
                plots = Plots(strata = fac, type = "none")))
allPerms(7, how(within = Within(type = "free"),
                plots = Plots(strata = fac)))
## series permutations in levels of strata
ctrl <- how(within = Within(type = "series"), plots = Plots(strata = fac))
numPerms(7, control = ctrl)
allPerms(7, control = ctrl)



