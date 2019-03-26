library(epiDisplay)


### Name: mhor
### Title: Mantel-Haenszel odds ratio
### Aliases: mhor
### Keywords: array

### ** Examples

data(Oswego)
with(Oswego, cc(ill, chocolate))
with(Oswego, mhor(ill, chocolate, sex))

mht1 <- with(Oswego, table(ill, chocolate, sex))
dim(mht1)
mhor(mhtable=mht1) # same results




