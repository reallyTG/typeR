library(rms)


### Name: bj
### Title: Buckley-James Multiple Regression Model
### Aliases: bj bj.fit residuals.bj print.bj validate.bj bjplot
### Keywords: models survival

### ** Examples

set.seed(1)
ftime  <- 10*rexp(200)
stroke <- ifelse(ftime > 10, 0, 1)
ftime  <- pmin(ftime, 10)
units(ftime) <- "Month"
age <- rnorm(200, 70, 10)
hospital <- factor(sample(c('a','b'),200,TRUE))
dd <- datadist(age, hospital)
options(datadist="dd")

f <- bj(Surv(ftime, stroke) ~ rcs(age,5) + hospital, x=TRUE, y=TRUE)
# add link="identity" to use a censored normal regression model instead
# of a lognormal one
anova(f)
fastbw(f)
validate(f, B=15)
plot(Predict(f, age, hospital))
# needs datadist since no explicit age,hosp.
coef(f)               # look at regression coefficients
coef(psm(Surv(ftime, stroke) ~ rcs(age,5) + hospital, dist='lognormal'))
                      # compare with coefficients from likelihood-based
                      # log-normal regression model
                      # use dist='gau' not under R 


r <- resid(f, 'censored.normalized')
survplot(npsurv(r ~ 1), conf='none') 
                      # plot Kaplan-Meier estimate of 
                      # survival function of standardized residuals
survplot(npsurv(r ~ cut2(age, g=2)), conf='none')  
                      # may desire both strata to be n(0,1)
options(datadist=NULL)



