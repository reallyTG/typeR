library(DAAG)


### Name: appletaste
### Title: Tasting experiment that compared four apple varieties
### Aliases: appletaste
### Keywords: datasets

### ** Examples

data(appletaste)
appletaste.aov <- aov(aftertaste ~ panelist + product, data=appletaste)
termplot(appletaste.aov)



