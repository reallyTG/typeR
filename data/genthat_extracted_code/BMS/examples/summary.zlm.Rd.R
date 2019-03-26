library(BMS)


### Name: summary.zlm
### Title: Summarizing Linear Models under Zellner's g
### Aliases: summary.zlm
### Keywords: utilities

### ** Examples

data(datafls)

#simple example
foo = zlm(datafls)
summary(foo)

sfoo = summary(foo,printout=FALSE)
print(sfoo$E.shrinkage)




