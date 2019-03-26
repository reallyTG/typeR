library(ConjointChecks)


### Name: plot.checks
### Title: Plot checks produced by 'ConjointChecks'.
### Aliases: plot.checks

### ** Examples

par(mfrow=c(3,2))
plot(rasch5000)
plot(rasch5000,items=c(5,10,15))
for (i in c(3,9,13,18)) plot(rasch5000,items=i)



