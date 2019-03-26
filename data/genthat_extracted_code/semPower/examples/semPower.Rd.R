library(semPower)


### Name: semPower
### Title: semPower: Power analyses for structural equation models (SEM).
### Aliases: semPower semPower-package semPower-package

### ** Examples

# a-priori power analyses using rmsea = .05 a target power (1-beta) of .80
ap1 <- semPower.aPriori(0.05, 'RMSEA', alpha = .05, beta = .20, df = 200)
summary(ap1)
# a-priori power analyses using f0 = .75 and a target power of .95
ap2 <- semPower.aPriori(0.75, 'F0', alpha = .05, power = .95, df = 200)
summary(ap2)
# create a plot showing how power varies by N (given a certain effect)
semPower.powerPlot.byN(.05, 'RMSEA', alpha=.05, df=200, power.min=.05, power.max=.99)
# post-hoc power analyses using rmsea = .08
ph <- semPower.postHoc(.08, 'RMSEA', alpha = .05, N = 250, df = 50)
summary(ph)
# create a plot showing how power varies by the magnitude of effect (given a certain N)
semPower.powerPlot.byEffect('RMSEA', alpha=.05, N = 100, df=200, effect.min=.001, effect.max=.10)
# compromise power analyses using rmsea = .08 and an abratio of 2
cp <- semPower.compromise(.08, 'RMSEA', abratio = 2, N = 1000, df = 200)
summary(cp)

# use lavaan to define effect through covariance matrices:
## Not run: 
##D library(lavaan)
##D 
##D # define population model (= H0)
##D model.pop <- '
##D f1 =~ .8*x1 + .7*x2 + .6*x3
##D f2 =~ .7*x4 + .6*x5 + .5*x6
##D f1 ~~ 1*f1
##D f2 ~~ 1*f2
##D f1 ~~ 0.5*f2
##D '
##D # define (wrong) H1 model
##D model.h1 <- '
##D f1 =~ x1 + x2 + x3
##D f2 =~ x4 + x5 + x6
##D f1 ~~ 0*f2
##D '
##D 
##D # get population covariance matrix; equivalent to a perfectly fitting H0 model
##D cov.h0 <- fitted(sem(model.pop))$cov
##D # get covariance matrix as implied by H1 model
##D res.h1 <- sem(model.h1, sample.cov = cov.h0, sample.nobs = 1000, likelihood='wishart')
##D df <- res.h1@test[[1]]$df
##D cov.h1 <- fitted(res.h1)$cov
##D 
##D ## do power analyses
##D 
##D # post-hoc
##D ph <- semPower.postHoc(SigmaHat = cov.h1, Sigma = cov.h0, alpha = .05, N = 1000, df = df)
##D summary(ph)
##D # => Power to reject the H1 model is > .9999 (1-beta = 1-1.347826e-08) with N = 1000 at alpha=.05
##D 
##D # compare:
##D ph$fmin * (ph$N-1)
##D fitmeasures(res.h1, 'chisq')
##D # => expected chi-square matches empirical chi-square
##D 
##D # a-priori
##D ap <- semPower.aPriori(SigmaHat = cov.h1, Sigma = cov.h0, alpha = .05, power = .80, df = df)
##D summary(ap)
##D # => N = 194 gives a power of ~80% to reject the H1 model at alpha = .05
##D 
##D # compromise
##D cp <- semPower.compromise(SigmaHat = cov.h1, Sigma = cov.h0, abratio = 1, N = 1000, df = df)
##D summary(cp)
##D # => A critical Chi-Squared of 33.999 gives balanced alpha-beta
##D #    error probabilities of alpha=beta=0.000089 with N = 1000.
##D 
## End(Not run)




