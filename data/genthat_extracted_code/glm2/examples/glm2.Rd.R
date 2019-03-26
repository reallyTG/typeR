library(glm2)


### Name: glm2
### Title: Fitting Generalized Linear Models
### Aliases: glm2

### ** Examples

library(glm2)
data(crabs)
data(heart)

#==========================================================
# EXAMPLE 1: logistic regression null model
# (behaviour of glm and glm2 for different starting values)
#==========================================================

y <- c(1,1,1,0)
# intercept estimate = log(0.75/0.25) = 1.098612

#--- identical behaviour ---#
fit1 <- glm(y ~ 1, family=binomial(link="logit"),
	control=glm.control(trace=TRUE))
fit2 <- glm2(y ~ 1, family=binomial(link="logit"),
	control=glm.control(trace=TRUE))
print.noquote(c(fit1$coef,fit2$coef))

#--- convergence via different paths ---#
fit1 <- glm(y ~ 1, family=binomial(link="logit"),start=-1.75,
	control=glm.control(trace=TRUE))
fit2 <- glm2(y ~ 1, family=binomial(link="logit"),start=-1.75,
	control=glm.control(trace=TRUE))
print.noquote(c(fit1$coef,fit2$coef))

#--- divergence of glm to infinite estimate ---#
fit1 <- glm(y ~ 1, family=binomial(link="logit"),start=-1.81)
fit2 <- glm2(y ~ 1, family=binomial(link="logit"),start=-1.81)
print.noquote(c(fit1$coef,fit2$coef))


#=======================================================================
# EXAMPLE 2: identity link Poisson (successful boundary convergence
# using 4 identical approaches in glm and glm2 with the method argument) 
#=======================================================================

satellites <- crabs$Satellites
width.shifted <- crabs$Width - min(crabs$Width)
dark <- crabs$Dark
goodspine <- crabs$GoodSpine

fit1 <- glm(satellites ~ width.shifted + factor(dark) + factor(goodspine), 
 family = poisson(link="identity"), start = rep(1,4))

fit2 <- glm2(satellites ~ width.shifted + factor(dark) + factor(goodspine), 
 family = poisson(link="identity"), start = rep(1,4))

fit1.eq <- glm2(satellites ~ width.shifted + factor(dark) + factor(goodspine), 
 family = poisson(link="identity"), start = rep(1,4), method = "glm.fit")

fit2.eq <- glm(satellites ~ width.shifted + factor(dark) + factor(goodspine), 
 family = poisson(link="identity"), start = rep(1,4), method = "glm.fit2")

noquote(c("deviances: ",fit1$dev,fit2$dev,fit1.eq$dev,fit2.eq$dev))
noquote(c("converged: ",fit1$conv,fit2$conv,fit1.eq$conv,fit2.eq$conv))
noquote(c("boundary:  ",fit1$bound,fit2$bound,fit1.eq$bound,fit2.eq$bound))

#===================================================================
# EXAMPLE 3: identity link Poisson (periodic non-convergence in glm)
#===================================================================

R1 <- crabs$Rep1
satellites <- crabs$Satellites[R1]
width.shifted <- crabs$Width[R1] - min(crabs$Width)
dark <- crabs$Dark[R1]
goodspine <- crabs$GoodSpine[R1]

fit1 <- glm(satellites ~ width.shifted + factor(dark) + factor(goodspine), 
 family = poisson(link="identity"), start = rep(1,4), 
 control = glm.control(trace=TRUE))

fit2 <- glm2(satellites ~ width.shifted + factor(dark) + factor(goodspine), 
 family = poisson(link="identity"), start = rep(1,4), 
 control = glm.control(trace=TRUE))

noquote(c("deviances: ",fit1$dev,fit2$dev))
noquote(c("converged: ",fit1$conv,fit2$conv))

#===============================================================
# EXAMPLE 4: log link binomial (periodic non-convergence in glm)
#===============================================================

patients <- heart$Patients
deaths <- heart$Deaths
agegroup <- heart$AgeGroup
severity <-heart$Severity
delay <- heart$Delay
region <- heart$Region
start.p <- sum(deaths)/sum(patients)

fit1 <- glm(cbind(deaths,patients-deaths) ~ factor(agegroup) + factor(severity)
 + factor(delay) + factor(region), family = binomial(link="log"), 
 start = c(log(start.p), rep(0,8)), control = glm.control(trace=TRUE,maxit=100))

fit2 <- glm2(cbind(deaths,patients-deaths) ~ factor(agegroup) + factor(severity)
 + factor(delay) + factor(region), family = binomial(link="log"), 
 start = c(log(start.p), rep(0,8)), control = glm.control(trace=TRUE))

noquote(c("deviances: ",fit1$dev,fit2$dev))
noquote(c("converged: ",fit1$conv,fit2$conv))

#====================================================================
# EXAMPLE 5: identity link Poisson (aperiodic non-convergence in glm)
#====================================================================

R2 <- crabs$Rep2
satellites <- crabs$Satellites[R2]
width.shifted <- crabs$Width[R2] - min(crabs$Width)
dark <- crabs$Dark[R2]
goodspine <- crabs$GoodSpine[R2]

fit1 <- glm(satellites ~ width.shifted + factor(dark) + factor(goodspine), 
 family = poisson(link="identity"), start = rep(1,4), 
 control = glm.control(trace=TRUE))

fit2 <- glm2(satellites ~ width.shifted + factor(dark) + factor(goodspine), 
 family = poisson(link="identity"), start = rep(1,4), 
 control = glm.control(trace=TRUE))

noquote(c("deviances: ",fit1$dev,fit2$dev))
noquote(c("converged: ",fit1$conv,fit2$conv))




