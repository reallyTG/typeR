library(MixedPsy)


### Name: pseMer
### Title: PSE/JND for GLMM Using Bootstrap Methods
### Aliases: pseMer
### Keywords: Bootstrap GLMM Multivariable Univariable

### ** Examples

## Example 1: estimate pse/jnd of a univariable GLMM
library(lme4)
data(vibro_exp3)
formula.mod1 <- cbind(faster, slower) ~ speed + (1 + speed| subject)
mod1 <- glmer(formula = formula.mod1, family = binomial(link = "probit"), 
              data = vibro_exp3[vibro_exp3$vibration == 0,])
## Don't show: 
BootEstim.1a <- pseMer(mod1, B = 5, ci.type = c("perc"))
## End(Don't show)
## No test: 
BootEstim.1 <- pseMer(mod1, B = 100, ci.type = c("perc"))
## End(No test)

## Example 2: specify custom parameters for bootstrap estimation of a 
# multivariate model

formula.mod2 <- cbind(faster, slower) ~ speed * vibration + (1 + speed| subject)
mod2 <- glmer(formula = formula.mod2, family = binomial(link = "probit"), 
               data = vibro_exp3)
              
fun2mod = function(mer.obj){
#allocate space: 4 parameters (jnd_0Hz, jnd_32Hz, pse_0Hz, pse_32Hz) j
jndpse = vector(mode = "numeric", length = 4)
names(jndpse) = c("jnd_0Hz","jnd_32Hz", "pse_0Hz", "pse_32Hz")
jndpse[1] = qnorm(0.75)/fixef(mer.obj)[2] #jnd_0Hz
jndpse[2] = qnorm(0.75)/(fixef(mer.obj)[2] + fixef(mer.obj)[4]) #jnd_32Hz
jndpse[3] = -fixef(mer.obj)[1]/fixef(mer.obj)[2] #pse_0Hz
jndpse[4] = -(fixef(mer.obj)[1] + fixef(mer.obj)[3])/(fixef(mer.obj)[2] 
               + fixef(mer.obj)[4]) #pse_32Hz
return(jndpse)
}

## No test: 
BootEstim.2 = pseMer(mod2, B = 100, FUN = fun2mod)
## End(No test)




