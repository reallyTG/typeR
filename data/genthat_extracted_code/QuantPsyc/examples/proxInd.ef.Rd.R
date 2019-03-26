library(QuantPsyc)


### Name: proxInd.ef
### Title: Simple Mediation for use in Bootstrapping
### Aliases: proxInd.ef
### Keywords: models

### ** Examples

require(boot)
data(tra)
tmp.tra <- tra
names(tmp.tra) <- c('x','z','m','y')
med.boot <- boot(tmp.tra, proxInd.ef, R=999)
sort(med.boot$t)[c(25,975)]	#95% CI
plot(density(med.boot$t))	# Distribution of bootstapped indirect effect
summary(med.boot$t)



