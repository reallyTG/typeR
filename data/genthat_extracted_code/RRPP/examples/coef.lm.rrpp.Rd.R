library(RRPP)


### Name: coef.lm.rrpp
### Title: coef for lm.rrpp model fits
### Aliases: coef.lm.rrpp
### Keywords: utilities

### ** Examples

# See examples for lm.rrpp to see how anova.lm.rrpp works in conjunction
# with other functions

data(Pupfish)
names(Pupfish)
Pupfish$logSize <- log(Pupfish$CS) # better to not have functions in formulas

fit <- lm.rrpp(coords ~ logSize + Sex*Pop, SS.type = "I", data = Pupfish) 

coef(fit)
coef(fit, test = TRUE, confidence = 0.99)



