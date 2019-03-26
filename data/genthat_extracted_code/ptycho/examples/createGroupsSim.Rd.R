library(ptycho)


### Name: createGroupsSim
### Title: Create Groups of Covariates
### Aliases: createGroupsSim

### ** Examples

grp <- createGroupsSim(G=3, p=15)
# Which covariates are in group 2?  Two ways to find out:
which(grp$var2group == 2)
grp$group2var[[2]]



