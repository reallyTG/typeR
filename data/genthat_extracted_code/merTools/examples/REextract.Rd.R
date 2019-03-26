library(merTools)


### Name: REextract
### Title: Extracts random effects
### Aliases: REextract

### ** Examples

require(lme4)
m2 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
rfx <- REextract(m2)
#Note the column names
head(rfx)



