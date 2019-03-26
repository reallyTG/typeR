library(ResourceSelection)


### Name: makeUsedAvail
### Title: Make a Used-Available Data Frame
### Aliases: makeUsedAvail makeUsedAvail.default makeUsedAvail.formula
### Keywords: manip

### ** Examples

(x <- data.frame(species=rep(1:0,each=4), var1=1:8, var2=11:18))
makeUsedAvail(species ~ var1 + var2, x)



