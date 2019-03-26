library(ssym)


### Name: extra.parameter
### Title: Tool that supports the estimation of the extra parameter.
### Aliases: extra.parameter

### ** Examples

###################################################################################
############### Textures of snacks Data - a log-Student-t model  #################
###################################################################################
#data("Snacks", package="ssym")
#fit <- extra.parameter(log(texture) ~ type + ncs(week) | type, data=Snacks,
#        family='Student', xi=10)
#summary(fit)
#
############################ Extra parameter ###########################
#extra.parameter(fit,5,50)

###################################################################################
################## Biaxial Fatigue Data - a Birnbaum-Saunders model   #############
###################################################################################
#data("Biaxial", package="ssym")
#fit <- ssym.nl(log(Life) ~ b1*Work^b2, start=c(b1=16, b2=-0.25),
#                data=Biaxial, family='Sinh-normal', xi=1.54)
#summary(fit)
#
########################### Extra parameter ###########################
#extra.parameter(fit,1.3,1.8)



