library(powerAnalysis)


### Name: ES.anova.oneway
### Title: Calculating effect size (Cohen's f) of one-way anova for means
###   with equal observations in each group
### Aliases: ES.anova.oneway

### ** Examples

set.seed(9);x=rnorm(50);y=rnorm(50)
z=rnorm(50);d=data.frame(x,y,z)
ES.anova.oneway(data=d)

ES.anova.oneway(sst=50,ssb=1)



