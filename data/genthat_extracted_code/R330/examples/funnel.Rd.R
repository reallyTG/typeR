library(R330)


### Name: funnel
### Title: Plots for checking for unequal variances
### Aliases: funnel funnel.lm funnel.formula
### Keywords: aplot

### ** Examples

data(educ.df)
educ50.lm = lm(educ~urban + percap + under18, data=educ.df, subset=-50)
funnel(educ50.lm)
#
funnel(educ~urban + percap + under18, data=educ.df, subset=-50)



