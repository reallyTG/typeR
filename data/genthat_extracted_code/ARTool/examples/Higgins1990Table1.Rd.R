library(ARTool)


### Name: Higgins1990Table1
### Title: Synthetic 3x3 Factorial Randomized Experiment
### Aliases: Higgins1990Table1
### Keywords: datasets

### ** Examples


data(Higgins1990Table1)

## run aligned-rank transform and ANOVA on the data
## Note: because there is only one observation per Subject 
## in this dataset, we do not need to include Subject as 
## a grouping term in this formula. Indeed, if we did, 
## lmer would complain when we attempt the ANOVA.
m <- art(Response ~ Row*Column, data=Higgins1990Table1)
anova(m)




