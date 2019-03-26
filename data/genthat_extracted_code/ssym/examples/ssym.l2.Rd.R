library(ssym)


### Name: ssym.l2
### Title: Fitting Censored Semi-parametric Log-symmetric Regression Models
### Aliases: ssym.l2

### ** Examples


###################################################################################
################ Lung Cancer Trial - a log-Student model ##########################
###################################################################################
#data("veteran", package="survival")
#fit <- ssym.l2(Surv(log(time), status) ~ karno| karno, data = veteran,
#              family="Student", xi=4.5)
#summary(fit)
#
########################### Extra parameter ###########################
#extra.parameter(fit,3,10)
#
################## Graph of deviance-type residuals ##################
#plot(fit)

####################################################################################
########## Primary biliary cirrhosis - a Power-exponential model ###################
####################################################################################
# data("pbc", package="survival")
# pbc2 <- data.frame(pbc[!is.na(pbc$edema) & !is.na(pbc$stage) & !is.na(pbc$bili),])
#
# fit <- ssym.l2(Surv(log(time),ifelse(status>=1,1,0) ) ~ factor(edema) +
#                stage + ncs(bili), data = pbc2, family="Powerexp",
#                xi=0.47, local.influence=TRUE)
# summary(fit)
#
########################### Extra parameter ###########################
#extra.parameter(fit,c(0.6,3),c(0.9,5))
#
################## Graph of the nonparametric effect ##################
#np.graph(fit, which=1, exp=TRUE)
#
################## Graph of deviance-type residuals ##################
#plot(fit)

####################################################################################
################### Myeloma - a Birnbaum-Saunders model ###########################
####################################################################################
# data("myeloma", package="ssym")
#
#fit <- ssym.l2(Surv(log(t),1-event) ~ x1 + x2 + x5| -1 + x3, data=myeloma,
#       family="Sinh-normal", xi=1.8)
#summary(fit)
#
################## Graph of deviance-type residuals ##################
#plot(fit)

####################################################################################
################ Baboons Data - a log-power-exponential model   ####################
####################################################################################
########################## left-censored observations ##############################
####################################################################################

#data("Baboons", package="ssym")
#fit <- ssym.l2(Surv(-log(t),1-cs) ~ 1, data=Baboons, family="Powerexp", xi=-0.35)
#
#summary(fit)
################## Graph of deviance-type residuals ##################
#plot(fit)




