library(rms)


### Name: nomogram
### Title: Draw a Nomogram Representing a Regression Fit
### Aliases: nomogram print.nomogram plot.nomogram legend.nomabbrev
### Keywords: models regression hplot

### ** Examples

n <- 1000    # define sample size
set.seed(17) # so can reproduce the results
d <- data.frame(age = rnorm(n, 50, 10),
                blood.pressure = rnorm(n, 120, 15),
                cholesterol = rnorm(n, 200, 25),
                sex = factor(sample(c('female','male'), n,TRUE)))

# Specify population model for log odds that Y=1
# Simulate binary y to have Prob(y=1) = 1/[1+exp(-L)]
d <- upData(d,
  L = .4*(sex=='male') + .045*(age-50) +
       (log(cholesterol - 10)-5.2)*(-2*(sex=='female') + 2*(sex=='male')),
  y = ifelse(runif(n) < plogis(L), 1, 0))

ddist <- datadist(d); options(datadist='ddist')


f <- lrm(y ~ lsp(age,50) + sex * rcs(cholesterol, 4) + blood.pressure,
         data=d)
nom <- nomogram(f, fun=function(x)1/(1+exp(-x)),  # or fun=plogis
    fun.at=c(.001,.01,.05,seq(.1,.9,by=.1),.95,.99,.999),
    funlabel="Risk of Death")
#Instead of fun.at, could have specified fun.lp.at=logit of
#sequence above - faster and slightly more accurate
plot(nom, xfrac=.45)
print(nom)
nom <- nomogram(f, age=seq(10,90,by=10))
plot(nom, xfrac=.45)
g <- lrm(y ~ sex + rcs(age, 3) * rcs(cholesterol, 3), data=d)
nom <- nomogram(g, interact=list(age=c(20,40,60)), 
                conf.int=c(.7,.9,.95))
plot(nom, col.conf=c(1,.5,.2), naxes=7)

w <- upData(d,
            cens = 15 * runif(n),
            h = .02 * exp(.04 * (age - 50) + .8 * (sex == 'Female')),
            d.time = -log(runif(n)) / h,
            death = ifelse(d.time <= cens, 1, 0),
            d.time = pmin(d.time, cens))


f <- psm(Surv(d.time,death) ~ sex * age, data=w, dist='lognormal')
med  <- Quantile(f)
surv <- Survival(f)  # This would also work if f was from cph
plot(nomogram(f, fun=function(x) med(lp=x), funlabel="Median Survival Time"))
nom <- nomogram(f, fun=list(function(x) surv(3, x),
                            function(x) surv(6, x)),
            funlabel=c("3-Month Survival Probability", 
                       "6-month Survival Probability"))
plot(nom, xfrac=.7)

## Not run: 
##D nom <- nomogram(fit.with.categorical.predictors, abbrev=TRUE, minlength=1)
##D nom$x1$points   # print points assigned to each level of x1 for its axis
##D #Add legend for abbreviations for category levels
##D abb <- attr(nom, 'info')$abbrev$treatment
##D legend(locator(1), abb$full, pch=paste(abb$abbrev,collapse=''), 
##D        ncol=2, bty='n')  # this only works for 1-letter abbreviations
##D #Or use the legend.nomabbrev function:
##D legend.nomabbrev(nom, 'treatment', locator(1), ncol=2, bty='n')
## End(Not run)


#Make a nomogram with axes predicting probabilities Y>=j for all j=1-3
#in an ordinal logistic model, where Y=0,1,2,3
w <- upData(w, Y = ifelse(y==0, 0, sample(1:3, length(y), TRUE)))
g <- lrm(Y ~ age+rcs(cholesterol,4) * sex, data=w)
fun2 <- function(x) plogis(x-g$coef[1]+g$coef[2])
fun3 <- function(x) plogis(x-g$coef[1]+g$coef[3])
f <- Newlabels(g, c(age='Age in Years'))  
#see Design.Misc, which also has Newlevels to change 
#labels for levels of categorical variables
g <- nomogram(f, fun=list('Prob Y>=1'=plogis, 'Prob Y>=2'=fun2, 
                     'Prob Y=3'=fun3), 
         fun.at=c(.01,.05,seq(.1,.9,by=.1),.95,.99))
plot(g, lmgp=.2, cex.axis=.6)
options(datadist=NULL)



