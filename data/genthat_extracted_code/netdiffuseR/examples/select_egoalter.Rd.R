library(netdiffuseR)


### Name: select_egoalter
### Title: Calculate the number of adoption changes between ego and alter.
### Aliases: select_egoalter adopt_changes summary.diffnet_adoptChanges

### ** Examples

# Simple example ------------------------------------------------------------
set.seed(1312)
dn <- rdiffnet(20, 5, seed.graph="small-world")

ans <- adopt_changes(dn)
str(ans)
summary(ans)



