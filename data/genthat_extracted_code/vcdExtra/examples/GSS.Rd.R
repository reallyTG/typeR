library(vcdExtra)


### Name: GSS
### Title: General Social Survey- Sex and Party affiliation
### Aliases: GSS
### Keywords: datasets

### ** Examples

data(GSS)
## maybe str(GSS) ; plot(GSS) ...
(GSStab <- xtabs(count ~ sex + party, data=GSS))

mod.glm <- glm(count ~ sex + party, family = poisson, data = GSS)




