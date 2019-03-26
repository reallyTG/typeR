library(survival)


### Name: survexp
### Title: Compute Expected Survival
### Aliases: survexp print.survexp
### Keywords: survival

### ** Examples

# 
# Stanford heart transplant data
#  We don't have sex in the data set, but know it to be nearly all males.
# Estimate of conditional survival  
fit1 <- survexp(futime ~ 1, rmap=list(sex="male", year=accept.dt,   
          age=(accept.dt-birth.dt)), method='conditional', data=jasa)
summary(fit1, times=1:10*182.5, scale=365) #expected survival by 1/2 years

# Estimate of expected  survival stratified by prior surgery 
survexp(~ surgery, rmap= list(sex="male", year=accept.dt,  
	age=(accept.dt-birth.dt)), method='ederer', data=jasa,
        times=1:10 * 182.5) 

## Compare the survival curves for the Mayo PBC data to Cox model fit
## 
pfit <-coxph(Surv(time,status>0) ~ trt + log(bili) + log(protime) + age +
                platelet, data=pbc)
plot(survfit(Surv(time, status>0) ~ trt, data=pbc), mark.time=FALSE)
lines(survexp( ~ trt, ratetable=pfit, data=pbc), col='purple')



