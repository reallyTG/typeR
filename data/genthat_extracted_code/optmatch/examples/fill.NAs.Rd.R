library(optmatch)


### Name: fill.NAs
### Title: Create missingness indicator variables and non-informatively
###   fill in missing values
### Aliases: fill.NAs
### Keywords: manip

### ** Examples

data(nuclearplants)
### Extract some representative covariates:
np.missing <- nuclearplants[c('t1', 't2', 'ne', 'ct', 'cum.n')]

 ### create some missingness in the covariates
 n <- dim(np.missing)[1]
 k <- dim(np.missing)[2]

 for (i in 1:n) {
   missing <- rbinom(1, prob = .1, size = k)
   if (missing > 0) {
     np.missing[i, sample(k, missing)] <- NA
   }
 }

### Restore outcome and treatment variables:
np.missing <- data.frame(nuclearplants[c('cost', 'pr')], np.missing)

### Fit a propensity score but with missing covariate data flagged
### and filled in, as in Rosenbaum and Rubin (1984, Appendix):
np.filled <- fill.NAs(pr ~ t1 * t2, np.missing)
# Look at np.filled to establish what missingness flags were created
head(np.filled)
(np.glm <- glm(pr ~ ., family=binomial, data=np.filled))
(glm(pr ~ t1 + t2 + `t1:t2` + t1.NA + t2.NA,
                family=binomial, data=np.filled))
# In a non-interactive session, the following may help, as long as
# the formula passed to `fill.NAs` (plus any missingness flags) is
# the desired formula for the glm.
(glm(formula(terms(np.filled)), family=binomial, data=np.filled))

### produce a matrix of propensity distances based on the propensity model
### with fill-in and flagging. Then perform pair matching on it:
pairmatch(match_on(np.glm, data=np.filled), data=np.filled)

## fill NAs without using treatment contrasts by making a list of contrasts for
## each factor ## following hints from https://stackoverflow.com/a/4569239/161808

np.missing$t1F<-factor(np.missing$t1)
cov.factors <- sapply(np.missing[,c("t1F","t2")],is.factor)
cov.contrasts <- lapply(
  np.missing[,names(cov.factors)[cov.factors],drop=FALSE],
  contrasts, contrasts = FALSE)

## make a data frame filling the missing covariate values, but without
## excluding any levels of any factors
np.noNA2<-fill.NAs(pr~t1F+t2,data=np.missing,contrasts.arg=cov.contrasts)




