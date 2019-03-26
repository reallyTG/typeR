library(heplots)


### Name: RootStock
### Title: Growth of Apple Trees from Different Root Stocks
### Aliases: RootStock
### Keywords: datasets

### ** Examples

## Don't show: 
	# allow to work with car 1
	if (packageDescription("car")[["Version"]] < 2) {
		linearHypothesis <- linear.hypothesis
	}
## End(Don't show)
data(RootStock)
## maybe str(RootStock) ; plot(RootStock) ...
root.mod <- lm(cbind(girth4, ext4, girth15, weight15) ~ rootstock, data=RootStock)
Anova(root.mod)

pairs(root.mod)

# test two orthogonal contrasts among the rootstocks
hyp <- matrix(c(2,-1,-1,-1,-1,2,  1, 0,0,0,0,-1), 2, 6, byrow=TRUE)
linearHypothesis(root.mod, hyp)
heplot(root.mod, hypotheses=list(Contrasts=hyp, C1=hyp[1,], C2=hyp[2,]))

heplot1d(root.mod, hypotheses=list(Contrasts=hyp, C1=hyp[1,], C2=hyp[2,]))




