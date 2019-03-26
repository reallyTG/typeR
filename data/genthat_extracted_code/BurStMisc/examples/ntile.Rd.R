library(BurStMisc)


### Name: ntile
### Title: Membership of ntile groups
### Aliases: ntile
### Keywords: distribution

### ** Examples

ntile(setNames(state.area, state.name), 10)

ntile(Loblolly$height, 5, result="factor", reverse=TRUE)

ntile(c(-10:10, rep(0, 7)), 4)



