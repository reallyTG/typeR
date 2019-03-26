library(mitml)


### Name: testEstimates
### Title: Compute final estimates and inferences
### Aliases: testEstimates

### ** Examples

data(studentratings)

fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
imp <- panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5)

implist <- mitmlComplete(imp, print=1:5)

# fit multilevel model using lme4
require(lme4)
fit.lmer <- with(implist, lmer(SES ~ (1|ID)))

# * Example 1: combine estimates using model recognition
# final estimates and inferences sperately for each parameter (Rubin's rules)
testEstimates(fit.lmer)

# ... adjusted df for finite samples
testEstimates(fit.lmer, df.com=49)

# ... with additional table for variance components and ICCs
testEstimates(fit.lmer, var.comp=TRUE)

# * Example 2: combine estimates using matrices or lists
fit.lmer <- with(implist, lmer(SES ~ ReadAchiev + (1|ID)))

qhat <- sapply(fit.lmer, fixef)
uhat <- sapply(fit.lmer, function(x) diag(vcov(x)))
testEstimates(qhat=qhat, uhat=uhat)



