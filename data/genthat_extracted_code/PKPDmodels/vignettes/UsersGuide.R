### R code from vignette source 'UsersGuide.Rnw'

###################################################
### code chunk number 1: preliminaries
###################################################
options(width=69,digits=5,show.signif.stars=FALSE,str=strOptions(strict.width="cut"))
library(PKPDmodels)
library(lattice)
#lattice.options(default.theme = function() standard.theme())
lattice.options(default.theme = function() standard.theme(color=FALSE))


###################################################
### code chunk number 2: bolus_1cpt_sd_Vk_expr
###################################################
PKexpr("bolus", "sd")


###################################################
### code chunk number 3: bolus1cptSdVClExpr
###################################################
PKexpr("bolus", "sd", list(k ~ Cl/V))


###################################################
### code chunk number 4: bolus1cptSdlVlClExpr
###################################################
PKexpr("bolus", "sd", list(k ~ Cl/V, Cl ~ exp(lCl), V ~ exp(lV)))


###################################################
### code chunk number 5: bolus_1cpt_sd_Vk_expr
###################################################
(bolus1cptSdVk <- PKmod("bolus", "sd"))


###################################################
### code chunk number 6: bolusSdVkEval
###################################################
tvals <- 0:10
bolus1cptSdVk(dose=1, t=tvals, k=0.3, V=1)


###################################################
### code chunk number 7: bolusSdlVlCl
###################################################
(bolus1cptSdlVlCl <-
 PKmod("bolus", "sd", list(k ~ Cl/V, Cl ~ exp(lCl), V ~ exp(lV))))


###################################################
### code chunk number 8: bolusSdlVlClEval
###################################################
bolus1cptSdlVlCl(dose=1, t=tvals, lCl=log(0.3), lV=0)


###################################################
### code chunk number 9: strTheoph
###################################################
str(Theoph <- data.frame(lapply(Theoph, function(x) x)))


###################################################
### code chunk number 10: Theophplot
###################################################
print(xyplot(conc ~ Time|reorder(Subject, Theoph$conc, max),
             Theoph, type=c("g","b"),
             xlab="Time since drug administration (hr)",
             ylab="Serum concentration (mg/l)",
             aspect="xy", layout=c(6,2)))


###################################################
### code chunk number 11: oral1cptSdlkalVlCl
###################################################
oral1cptSdlkalVlCl <-
 PKmod("oral", "sd", list(ka ~ exp(lka), k ~ exp(lCl)/V, V ~ exp(lV)))


###################################################
### code chunk number 12: oral1cptSdlkalVlCl
###################################################
PKexpr("oral", "sd", list(ka ~ exp(lka), k ~ exp(lCl)/V, V ~ exp(lV)))


###################################################
### code chunk number 13: fm1
###################################################
summary(fm1 <- nls(conc ~ oral1cptSdlkalVlCl(Dose, Time, lV, lka, lCl),
                   Theoph, start=c(lV=-1, lka=0.5, lCl=-4),
                   subset=Subject==1), corr=TRUE)


