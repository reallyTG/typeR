library(multigroup)


### Name: DCCSWA
### Title: Dual Common Component and Specific Weights Analysis
### Aliases: DCCSWA

### ** Examples

Data = iris[,-5]
Group = iris[,5]
res.DCCSWA = DCCSWA(Data, Group, graph=TRUE)
loadingsplot(res.DCCSWA, axes=c(1,2))
scoreplot(res.DCCSWA, axes=c(1,2))



