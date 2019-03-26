library(SASmixed)


### Name: HR
### Title: Heart rates of patients on different drug treatments
### Aliases: HR
### Keywords: datasets

### ** Examples

str(HR)
if (require("lattice", quietly = TRUE, character = TRUE)) {
  xyplot(HR ~ Time | Patient, HR, type = c("g", "p", "r"), aspect = "xy",
         index.cond = function(x, y) coef(lm(y ~ x))[1],
         ylab = "Heart rate (beats/min)")
}
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ## linear trend in time
  print(fm1HR <- lmer(HR ~ Time * Drug + baseHR + (Time|Patient), HR))  
  print(anova(fm1HR))
## Not run: 
##D fm2HR <- update(fm1HR, weights = varPower(0.5)) # use power-of-mean variance
##D summary(fm2HR)
##D intervals(fm2HR)             # variance function does not seem significant
##D anova(fm1HR, fm2HR)         # confirm with likelihood ratio
## End(Not run)
 print(fm3HR <- lmer(HR ~ Time + Drug + baseHR + (Time|Patient), HR))
 print(anova(fm3HR))
 ## remove Drug term
 print(fm4HR <- lmer(HR ~ Time + baseHR + (Time|Patient), HR))
 print(anova(fm4HR))
}



