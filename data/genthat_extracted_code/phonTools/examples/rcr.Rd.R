library(phonTools)


### Name: rcr
### Title: Random Coefficients Regression
### Aliases: rcr print.rcr print.summary.rcr summary.rcr anova.rcr
###   print.anova.rcr plot.rcr

### ** Examples

data (pb52)

## runs an rcr model on the Peterson & Barney (1952) vowels to test 
## for the predictive value of the speaker's f0 and F3
rcr.model = rcr (f1 ~ f0 * f3, pb52$speaker, pb52)
rcr.model

## test for the significance of each individual coefficient 
summary (rcr.model)

## a similar analysis can be run using vowel category as the predictor
rcr.model = rcr (f1 ~ vowel, pb52$speaker, pb52)
rcr.model

## here, summary() tests each coefficient individually
summary (rcr.model)

## while anova() tests associated coefficients together
anova (rcr.model)



