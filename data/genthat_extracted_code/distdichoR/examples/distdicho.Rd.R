library(distdichoR)


### Name: distdicho
### Title: normal data
### Aliases: distdicho distdicho.default distdicho.formula

### ** Examples

## Proportions of low birth weight babies among smoking and non-smoking mothers
## (data from Peacock et al. 1995). Returns distributional estimates, standard 
## errors and distributional confidence intervals for differences in proportions,
## RR and OR of babies having a birth weight under 2500g (low birth weight)
## for group smoker (mother smokes) over the odds of LBW in group non-smoker 
## (mother doesn't smoke)
# Formula interface
distdicho(birthwt ~ smoke, cp = 2500, data = bwsmoke, exposed = 'smoker')
# Data stored in two vectors
bw_smoker <- bwsmoke$birthwt[bwsmoke$smoke == 'smoker']
bw_nonsmoker <- bwsmoke$birthwt[bwsmoke$smoke == 'non-smoker']
distdicho(x = bw_smoker, y = bw_nonsmoker, cp = 2500)


## Inverse Body Mass Index (transformation required to have a normal outcome)
## and parity (data from Peacock et al. 1995). Returns distributional estimates,
## standard errors and distributional confidence intervals for differences in 
## proportions, RR and OR of obese mothers (BMI of >30 kg/m^2) for multiparas 
## (group_par=1) over the odds of obesity in group primiparity (group_par=0).
distdicho(inv_bmi ~ group_par, cp = 0.033, data = bmi, exposed = '1')


## Inverse Body Mass Index (BMI) and employment. Returns distributional estimates,
## standard errors and distributional confidence intervals for differences in
## proportions, RR and OR with correction for unknown variance ratio of obese 
## mothers (BMI of >30 kg/m^2) for group_emp = 2 (mother unemployed) over
## the odds of obesity in group_emp = 1 (mother employed)
distdicho(inv_bmi ~ group_emp, cp = 0.033, R = 0, data = bmi2, exposed = '2')


## Inverse Body Mass Index (BMI) and employment. Returns distributional estimates,
## standard errors and distributional confidence intervals for differences in
## proportions, RR and OR computed under the hypothesis that the ratio of variances
## is equal to 1.3 of obese mothers (BMI of >30 kg/m^2) for group_emp = 2
## (mother unemployed) over the odds of obesity in group_emp = 1 (mother employed)
distdicho(inv_bmi ~ group_emp, cp = 0.033, R = 1.3, data = bmi2, exposed = '2')





