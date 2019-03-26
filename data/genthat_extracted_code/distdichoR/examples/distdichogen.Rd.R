library(distdichoR)


### Name: distdichogen
### Title: normal, skew-normal or gamma distributed data
### Aliases: distdichogen distdichogen.default distdichogen.formula

### ** Examples

## Proportions of low birth weight babies among smoking and non-smoking mothers
## (data from Peacock et al. 1995). Returns distributional estimates, standard 
## errors and distributional confidence intervals for differences in proportions,
## RR and OR of babies having a birth weight under 2500g (low birth weight)
## for group smoker (mother smokes) over the odds of LBW in group non-smoker 
## (mother doesn't smoke)
# Formula interface
distdichogen(birthwt ~ smoke, cp = 2500, data = bwsmoke, exposed = 'smoker',
             dist = 'sk_normal')
# Data stored in two vectors
bw_smoker <- bwsmoke$birthwt[bwsmoke$smoke == 'smoker']
bw_nonsmoker <- bwsmoke$birthwt[bwsmoke$smoke == 'non-smoker']
distdichogen(x = bw_smoker, y = bw_nonsmoker, 
              cp = 2500, tail = 'lower', dist = 'sk_normal')


## Body Mass Index (BMI) and parity. Returns distributional estimates, standard
## errors and distributional confidence intervals for difference in proportions,
## RR and OR of obese mothers (BMI of >30kg/m^2) for group_par=1 (multiparity) 
## over the odds of obesity in group_par=0 (primiparity)
distdichogen(bmi ~ group_par, cp = 30, data = bmi, exposed = '1',
             tail = 'upper', dist = 'sk_normal')







