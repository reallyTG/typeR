library(heplots)


### Name: Headache
### Title: Treatment of Headache Sufferers for Sensitivity to Noise
### Aliases: Headache
### Keywords: datasets

### ** Examples

data(Headache)
str(Headache)

# basic MLM, specifying between-S effects
headache.mod <- lm(cbind(u1, du1, u2, du2) ~ type * treatment, data=Headache)

##############################
## between-S tests
##############################
Anova(headache.mod, test="Roy")

# test each contrast separately
print(linearHypothesis(headache.mod, hypothesis="treatment1", test="Roy"), SSP=FALSE)
print(linearHypothesis(headache.mod, hypothesis="treatment2", test="Roy"), SSP=FALSE)
print(linearHypothesis(headache.mod, hypothesis="treatment3", test="Roy"), SSP=FALSE)


heplot(headache.mod, variables=c(1,3),
	hypotheses=paste("treatment", 1:3, sep=""),
	hyp.labels=c("extra.exp", "no.inst", "explicit.inst"),
	xlab="u1: Initial sensitivity", ylab="u2: Final sensitivity",
	main="Headache data: Unpleasant levels")
abline(0, 1, lty=5, col="gray")

heplot(headache.mod, variables=c(2,4),
	hypotheses=paste("treatment", 1:3, sep=""),
	xlab="du1: Initial sensitivity", ylab="du2: Final sensitivity",
	main="Headache data: Definitely Unpleasant levels")
abline(0, 1, lty=5, col="gray")

pairs(headache.mod)

##############################
# between-S and within-S tests
##############################
idata = expand.grid(level=factor(c("U", "DU")), phase=factor(1:2))
Anova(headache.mod, idata=idata, idesign=~level*phase)




