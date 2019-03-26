library(lme4)


### Name: lmList
### Title: Fit List of lm or glm Objects with a Common Model
### Aliases: lmList plot.lmList
### Keywords: models

### ** Examples

fm.plm  <- lmList(Reaction ~ Days | Subject, sleepstudy)
coef(fm.plm)
fm.2  <- update(fm.plm, pool = FALSE)
## coefficients are the same, "pooled or unpooled":
stopifnot( all.equal(coef(fm.2), coef(fm.plm)) )

(ci <- confint(fm.plm)) # print and rather *see* :
plot(ci)                # how widely they vary for the individuals



