library(robCompositions)


### Name: rSDev
### Title: Relative simplicial deviance
### Aliases: rSDev

### ** Examples

data(precipitation) 
tabprob <- prop.table(precipitation)
tabind <- indTab(precipitation)
tabint <- intTab(tabprob, tabind)
rSDev(tabprob, tabint$intTab)



