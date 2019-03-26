library(hiddenf)


### Name: anova.HiddenF
### Title: anova function for the class 'HiddenF'
### Aliases: anova.HiddenF anova
### Keywords: anova non-additivity hidden additivity

### ** Examples

data(cjejuni.mtx)
cjejuni.out <- HiddenF(cjejuni.mtx)
anova(cjejuni.out)
anova(cjejuni.out,method="KKSA")


