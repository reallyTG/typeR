library(speff2trial)


### Name: speff
### Title: Semiparametric efficient estimation and testing for a two-sample
###   treatment effect with a quantitative or dichotomous endpoint
### Aliases: speff

### ** Examples

str(ACTG175)

### treatment effect estimation with a quantitative endpoint missing
### at random
fit1 <- speff(cd496 ~ age+wtkg+hemo+homo+drugs+karnof+oprior+preanti+
race+gender+str2+strat+symptom+cd40+cd420+cd80+cd820+offtrt, 
postrandom=c("cd420","cd820","offtrt"), data=ACTG175, trt.id="treat")

### 'fit2' adds quadratic effects of CD420 and CD820 and their 
### two-way interaction
fit2 <- speff(cd496 ~ age+wtkg+hemo+homo+drugs+karnof+oprior+preanti+
race+gender+str2+strat+symptom+cd40+cd420+I(cd420^2)+cd80+cd820+
I(cd820^2)+cd420:cd820+offtrt, postrandom=c("cd420","I(cd420^2)",
"cd820","I(cd820^2)","cd420:cd820","offtrt"), data=ACTG175, 
trt.id="treat")

### 'fit3' uses R-squared as the optimization criterion
fit3 <- speff(cd496 ~ age+wtkg+hemo+homo+drugs+karnof+oprior+preanti+
race+gender+str2+strat+symptom+cd40+cd420+cd80+cd820+offtrt, 
postrandom=c("cd420","cd820","offtrt"), data=ACTG175, trt.id="treat", 
optimal="rsq")

### a dichotomous response is created with missing values maintained
ACTG175$cd496bin <- ifelse(ACTG175$cd496 > 250, 1, 0)

### treatment effect estimation with a dichotomous endpoint missing
### at random
fit4 <- speff(cd496bin ~ age+wtkg+hemo+homo+drugs+karnof+oprior+preanti+
race+gender+str2+strat+symptom+cd40+cd420+cd80+cd820+offtrt, 
postrandom=c("cd420","cd820","offtrt"), data=ACTG175, trt.id="treat", 
endpoint="dichotomous")



