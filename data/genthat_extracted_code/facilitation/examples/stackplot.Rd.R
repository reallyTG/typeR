library(facilitation)


### Name: stackplot
### Title: Plots
### Aliases: stackplot

### ** Examples

data(twospecies)
ab <- abundance.matrix(twospecies,seq(0,twospecies$maxtime,by=1))
# species 1
stackplot(ab[,1:3])
# species 2
stackplot(ab[,4:5])



