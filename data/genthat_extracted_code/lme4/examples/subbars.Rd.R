library(lme4)


### Name: subbars
### Title: "Sub[stitute] Bars"
### Aliases: subbars
### Keywords: models utilities

### ** Examples

subbars(Reaction ~ Days + (Days|Subject)) ## => Reaction ~ Days + (Days + Subject)



