library(heplots)


### Name: SocialCog
### Title: Social Cognitive Measures in Psychiatric Groups
### Aliases: SocialCog
### Keywords: datasets

### ** Examples

data(SocialCog)
SC.mod <- lm(cbind(MgeEmotions, ToM, ExtBias, PersBias) ~ Dx, data=SocialCog)
SC.mod
Anova(SC.mod)

# test hypotheses of interest in terms of contrasts
print(linearHypothesis(SC.mod, "Dx1"), SSP=FALSE)
print(linearHypothesis(SC.mod, "Dx2"), SSP=FALSE)

#' ## HE plots

heplot(SC.mod, hypotheses=list("Dx1"="Dx1", "Dx2"="Dx2"),
	fill=TRUE, fill.alpha=.1)
	
pairs(SC.mod, fill=c(TRUE,FALSE), fill.alpha=.1) 




