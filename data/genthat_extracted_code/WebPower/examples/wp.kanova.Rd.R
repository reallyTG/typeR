library(WebPower)


### Name: wp.kanova
### Title: Power analysis for two-way, three-way and k-way ANOVA
### Aliases: wp.kanova

### ** Examples

########## Chapter 6. two-way and three-way ANOVA  #############
## Main effect of two-way ANOVA
wp.kanova(n=120, ndf=2, f=0.2, alph=0.05, ng=6)

## Interaction effect of two-way ANOVA
wp.kanova(n=120, ndf=2, f=0.4, alph=0.05, ng=6)

## Interaction effect of three-way ANOVA
wp.kanova(n=360, ndf=4, f=0.3, alph=0.05, ng=18)




