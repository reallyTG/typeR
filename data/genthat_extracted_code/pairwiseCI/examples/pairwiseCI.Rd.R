library(pairwiseCI)


### Name: pairwiseCI
### Title: Wrapper function for two-sample confidence intervals
### Aliases: pairwiseCI
### Keywords: htest

### ** Examples


# some examples:
# In many cases the shown examples might not make sense,
# but display how the functions can be used.

data(Oats)

# # all pairwise comparisons,
# separately for each level of nitro:

apc <- pairwiseCI(yield ~ Variety, data=Oats,
 by="nitro", method="Param.diff")

apc

plot(apc)

# # many to one comparisons, with variety Marvellous as control,
# for each level of nitro separately:

m21 <- pairwiseCI(yield ~ Variety, data=Oats,
 by="nitro", method="Param.diff", control="Marvellous")

 plot(m21)

# # the same using confidence intervals for the ratio of means:

m21 <- pairwiseCI(yield ~ Variety, data=Oats,
 by="nitro", method="Param.diff", control="Marvellous")

 plot(m21, CIvert=TRUE, H0line=0.9)

###############################################

# The repellent data set (a trial on repellent 
# effect of sulphur on honey bees): Measured was
# the decrease of sugar solutions (the higher the decrease,
# the higher the feeding, and the less the repellent effect).
# Homogeneity of variances is questionable. Which of the doses
# leads to decrease of the variable decrease compared to the
# control group "H"?

data(repellent)
boxplot(decrease ~ treatment, data=repellent)

# as difference to control (corresponding to Welch tests)
beeCId<-pairwiseCI(decrease ~ treatment, data=repellent,
 method="Param.diff", control="H", alternative="less",
 var.equal=FALSE)
beeCId
plot(beeCId)

# as ratio to control:

## Not run: 
##D beeCIr<-pairwiseCI(decrease ~ treatment, data=repellent,
##D  method="Param.ratio", control="H", alternative="less",
##D  var.equal=FALSE)
##D beeCIr
##D plot(beeCIr)
##D 
##D # Bonferroni-adjustment can be applied:
##D 
##D beeCIrBonf<-pairwiseCI(decrease ~ treatment, data=repellent,
##D  method="Param.ratio", control="H", alternative="less",
##D  var.equal=FALSE, conf.level=1-0.05/7)
##D beeCIrBonf
##D plot(beeCIrBonf)
## End(Not run)

##############################################

# Proportions:

# The rooting example:
# Calculate confidence intervals for the 
# difference of proportions between the 3 doses of IBA,
# separately for 4 combinations of "Age" and "Position".
# Note: we pool over Rep in that way. Whether this makes
# sense or not, is decision of the user.

data(rooting)

# Risk difference

aprootsRD<-pairwiseCI(cbind(root, noroot) ~ IBA,
 data=rooting, by=c("Age", "Position"), method="Prop.diff")

aprootsRD

# Odds ratio


aprootsOR<-pairwiseCI(cbind(root, noroot) ~ IBA,
 data=rooting, by=c("Age", "Position"), method="Prop.or")

aprootsOR

# Risk ratio

aprootsRR<-pairwiseCI(cbind(root, noroot) ~ IBA,
 data=rooting, by=c("Age", "Position"), method="Prop.ratio")

aprootsRR

# CI can be plotted:

plot(aprootsRR)

###############################################

# CIs assuming lognormal distribution of the response:

resp<-rlnorm(n=20, meanlog = 0, sdlog = 1)
treat<-as.factor(rep(c("A","B")))
datln<-data.frame(resp=resp, treat=treat)

pairwiseCI(resp~treat, data=datln, method="Lognorm.diff")
pairwiseCI(resp~treat, data=datln,  method="Lognorm.ratio")




