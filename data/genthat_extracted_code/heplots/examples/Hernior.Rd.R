library(heplots)


### Name: Hernior
### Title: Recovery from Elective Herniorrhaphy
### Aliases: Hernior
### Keywords: datasets

### ** Examples

str(Hernior)
Hern.mod <- lm(cbind(leave, nurse, los) ~ 
               age + sex +  pstat +  build + cardiac + resp, data=Hernior)
Anova(Hern.mod, test="Roy") # actually, all tests are identical
# test overall regression
linearHypothesis(Hern.mod, c("age", "sexm", "pstat", "build", "cardiac", "resp"))
# joint test of age, sex & caridac
linearHypothesis(Hern.mod, c("age", "sexm", "cardiac"))

clr <- c("red", "darkgray", "blue", "darkgreen", "magenta", "brown", "black")
heplot(Hern.mod, col=clr)
pairs(Hern.mod, col=clr)

## Enhancing the pairs plot ...
# create better variable labels
vlab <- c("LeaveCondition\n(leave)", "NursingCare\n(nurse)", "LengthOfStay\n(los)")
# Add ellipse to test all 5 regressors simultaneously
hyp <- list("Regr" = c("age", "sexm", "pstat", "build", "cardiac", "resp"))
pairs(Hern.mod, hypotheses=hyp, col=clr, var.labels=vlab)

## Views in canonical space for the various predictors
if (require(candisc)) {
	Hern.canL <- candiscList(Hern.mod)
	plot(Hern.canL, term="age")
	plot(Hern.canL, term="sex")
	plot(Hern.canL, term="pstat")  # physical status
}




