library(synthpop)


### Name: replicated.uniques
### Title: Replications in synthetic data
### Aliases: replicated.uniques

### ** Examples

ods <- SD2011[1:1000,c("sex","age","edu","marital","smoke")]
s1 <- syn(ods, m = 2)
replicated.uniques(s1,ods)



