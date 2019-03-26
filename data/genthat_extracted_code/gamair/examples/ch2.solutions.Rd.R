library(gamair)


### Name: ch2.solutions
### Title: Solution code for Chapter 2: Linear Mixed Models
### Aliases: ch2.solutions

### ** Examples

library(gamair); library(mgcv)

## Q.6
## c)
library(nlme)
options(contrasts=c("contr.treatment",
                    "contr.treatment"))
m1 <- lme(Thickness~Site+Source,Oxide,~1|Lot/Wafer)
plot(m1)               # check resids vs. fitted vals
qqnorm(residuals(m1))  # check resids for normality
abline(0,sd(resid(m1)))# adding a "reference line"
qqnorm(m1,~ranef(.,level=1)) # check normality of b_k
qqnorm(m1,~ranef(.,level=2)) # check normality of c_(k)l
m2 <- lme(Thickness~Site+Source,Oxide,~1|Lot)
anova(m1,m2)
anova(m1)
intervals(m1)

## Q.7

library(nlme)
attach(Machines)
interaction.plot(Machine,Worker,score) # note 6B
## base model
m1<-lme(score~Machine,Machines,~1|Worker/Machine)
## check it...
plot(m1)
plot(m1,Machine~resid(.),abline=0)
plot(m1,Worker~resid(.),abline=0)
qqnorm(m1,~resid(.))
qqnorm(m1,~ranef(.,level=1))
qqnorm(m1,~ranef(.,level=2)) ## note outlier
## try more general r.e. structure
m2<-lme(score~Machine,Machines,~Machine|Worker)
## check it...
qqnorm(m2,~resid(.))
qqnorm(m2,~ranef(.,level=1)) ## still an outlier
## simplified model...
m0 <- lme(score~Machine,Machines,~1|Worker)
## formal comparison
anova(m0,m1,m2) ## m1 most appropriate
anova(m1)     ## significant Machine effect
intervals(m1) ## Machines B and C better than A
## remove problematic worker 6, machine B
Machines <- Machines[-(34:36),]
## re-running improves plots, but conclusions same.

## It seems that (2.6) is the most appropriate model of those tried,
## and broadly the same conclusions are reached with or without
## worker 6, on Machine B, which causes outliers on several checking
## plots. See next question for comparison of machines B and C.

## Q.8
# Using the data without worker 6 machine B:

intervals(m1,level=1-0.05/3,which="fixed")
levels(Machines$Machine)
Machines$Machine <- relevel(Machines$Machine,"B")
m1a <- lme(score ~ Machine, Machines, ~ 1|Worker/Machine)
intervals(m1a,level=1-0.05/3,which="fixed")

# So, there is evidence for differences between machine A and the
# other 2, but not between B and C, at the 5% level. However,
# depending on how economically significant the point estimate of
# the B-C difference is, it might be worth conducting a study with
# more workers in order to check whether the possible small
# difference might actually be real.

## Q.9
## c)
library(nlme);data(Gun)
options(contrasts=c("contr.treatment","contr.treatment"))
with(Gun,plot(Method,rounds))
with(Gun,plot(Physique,rounds))
m1 <- lme(rounds~Method+Physique,Gun,~1|Team)
plot(m1)              # fitted vs. resid plot
qqnorm(residuals(m1))
abline(0,m1$sigma)  # add line of "perfect Normality"
anova(m1)  # balanced data: don't need type="marginal"
m2 <- lme(rounds~Method,Gun,~1|Team)
intervals(m2)



