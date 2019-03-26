library(PHeval)


### Name: PHeval-package
### Title: Evaluation of the proportional hazards assumption with a
###   standardized score process
### Aliases: PHeval-package PHeval

### ** Examples

library(survival)
S=standscore(futime+fustat~resid.ds+rx,data=ovarian)
plotscore(S,printCB = TRUE)
R2(futime+fustat~resid.ds+rx,data=ovarian)



