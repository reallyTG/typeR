library(heplots)


### Name: mark.H0
### Title: Mark a point null hypothesis in an HE plot
### Aliases: mark.H0
### Keywords: aplot

### ** Examples

Vocab.mod <- lm(cbind(grade8,grade9,grade10,grade11) ~ 1, data=VocabGrowth)
idata <-data.frame(grade=ordered(8:11))

heplot(Vocab.mod, type="III", idata=idata, idesign=~grade, iterm="grade",
	main="HE plot for Grade effect")
mark.H0()



