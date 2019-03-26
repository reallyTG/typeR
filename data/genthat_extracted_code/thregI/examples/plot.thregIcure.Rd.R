library(thregI)


### Name: plot.thregIcure
### Title: plot survival, hazard and density curves
### Aliases: plot.thregIcure
### Keywords: cure rate interval-censored data plot survival analysis
###   threshold regression

### ** Examples

#load the data "hdsd"
data("hdsd", package="thregI")

#transform categorical variable Noadyn into factor variable f.noadyn
hdsd$f.noadyn=factor(hdsd$Noadyn)

#fit the threshold regression cure-rate model
#the covariates are TR360, Noadyn, Sex and Age
fit<-thregIcure(Surv(left, right, type='interval2')~f.noadyn|TR360|Sex+Age, data=hdsd)

#plot estimated hazard, survival and density function
#subject is ambulatory (Noadyn1=1), TR360 = 1.5, male and 30 years old
plot.thregIcure(fit, var=f.noadyn, scenario=TR360(1.5)+Sex(1)+Age(30), graph = "sv", nocolor = 1)
plot.thregIcure(fit, var=f.noadyn, scenario=TR360(1.5)+Sex(1)+Age(30), graph = "hz", nocolor = 1)
plot.thregIcure(fit, var=f.noadyn, scenario=TR360(1.5)+Sex(1)+Age(30), graph = "ds", nocolor = 1)



