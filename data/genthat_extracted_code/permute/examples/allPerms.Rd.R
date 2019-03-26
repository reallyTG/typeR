library(permute)


### Name: allPerms
### Title: Complete enumeration of all possible permutations
### Aliases: allPerms print.allPerms summary.allPerms
###   print.summary.allPerms as.matrix.allPerms as.allPerms

### ** Examples

## allPerms can work with a vector
vec <- c(3,4,5)
allPerms(vec) ## free permutation

## enumerate all possible permutations for a more complicated
## design
fac <- gl(2,6)
ctrl <- how(within = Within(type = "grid", mirror = FALSE,
                            constant = TRUE, nrow = 3, ncol = 2),
            plots = Plots(strata = fac))
Nobs <- length(fac)
numPerms(seq_len(Nobs), control = ctrl) ## 6
(tmp <- allPerms(Nobs, control = update(ctrl, observed = TRUE)))
(tmp2 <- allPerms(Nobs, control = ctrl))

## turn on mirroring
##ctrl$within$mirror <- TRUE
ctrl <- update(ctrl, within = update(getWithin(ctrl), mirror = TRUE))
numPerms(seq_len(Nobs), control = ctrl)
(tmp3 <- allPerms(Nobs, control = update(ctrl, observed = TRUE)))
(tmp4 <- allPerms(Nobs, control = ctrl))

## prints out details of the permutation scheme as
## well as the matrix of permutations
summary(tmp3)
summary(tmp4)



