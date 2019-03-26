library(PHeval)


### Name: standscore
### Title: Standardized Score Process
### Aliases: standscore

### ** Examples

library(survival)
data(ovarian)

#############################################
# Evaluation and plot of the standardized score process at parameter beta0 = 0

score1=standscore(futime+fustat~age+rx,data=ovarian)
plotscore(score1,printCB=TRUE)


#############################################
# Evaluation of the standardized score process at parameter
# beta0 = maximum partial likelihood estimator of beta

beta=coxph(Surv(futime,fustat)~age+rx,data=ovarian)$coeff
score2=standscore(futime+fustat~age+rx,data=ovarian,beta0=beta)

# Separated plots for each regression effect

par(mfrow=c(1,2))
plotscore(score2,printCB=TRUE,component.num=1,main="age")
plotscore(score2,printCB=TRUE,component.num=2,main="rx")

#############################################
# Evaluation and plot of the standardized score process at parameter beta0 = 0
# without global standardization 

fo="futime+fustat~age+rx"
score3=standscore(fo,data=ovarian,globstan=FALSE)
plotscore(score3)



