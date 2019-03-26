library(prevalence)


### Name: define
### Title: Definition of 'truePrevMulti' and 'truePrevMulti2' model
### Aliases: define_x define_prior define_prior2

### ** Examples

## how is a 2-test model defined?

define_x(2)
# Definition of the apparent test results, 'x', for 2 tests:
# x[1] : T1-,T2- 
# x[2] : T1-,T2+ 
# x[3] : T1+,T2- 
# x[4] : T1+,T2+

define_prior(2)
# Conditional probability scheme
# Definition of the prior, 'theta', for 2 tests: 
# theta[1] : P(D+) = TP
# theta[2] : P(T1+|D+) = SE1
# theta[3] : P(T1-|D-) = SP1
# theta[4] : P(T2+|D+,T1+)
# theta[5] : P(T2+|D+,T1-)
# theta[6] : P(T2-|D-,T1-)
# theta[7] : P(T2-|D-,T1+)

define_prior2(2)
# Covariance scheme
# Definition of the prior for 2 tests: 
# TP :    True Prevalence 
# SE[1] : Sensitity T1 
# SE[2] : Sensitity T2 
# SP[1] : Specificity T1 
# SP[2] : Specificity T2 
# a[1] :  Covariance(T1,T2|D+) 
# b[1] :  Covariance(T1,T2|D-)

## how is a 3-test model defined?

define_x(3)
# Definition of the apparent test results, 'x', for 3 tests:
# x[1] : T1-,T2-,T3- 
# x[2] : T1-,T2-,T3+ 
# x[3] : T1-,T2+,T3- 
# x[4] : T1-,T2+,T3+ 
# x[5] : T1+,T2-,T3- 
# x[6] : T1+,T2-,T3+ 
# x[7] : T1+,T2+,T3- 
# x[8] : T1+,T2+,T3+

define_prior(3)
# Conditional probability scheme
# Definition of the prior, 'theta', for 3 tests: 
# theta[1] : P(D+) = TP
# theta[2] : P(T1+|D+) = SE1
# theta[3] : P(T1-|D-) = SP1
# theta[4] : P(T2+|D+,T1+)
# theta[5] : P(T2+|D+,T1-)
# theta[6] : P(T2-|D-,T1-)
# theta[7] : P(T2-|D-,T1+)
# theta[8] : P(T3+|D+,T1+,T2+)
# theta[9] : P(T3+|D+,T1+,T2-)
# theta[10] : P(T3+|D+,T1-,T2+)
# theta[11] : P(T3+|D+,T1-,T2-)
# theta[12] : P(T3-|D-,T1-,T2-)
# theta[13] : P(T3-|D-,T1-,T2+)
# theta[14] : P(T3-|D-,T1+,T2-)
# theta[15] : P(T3-|D-,T1+,T2+)

define_prior2(3)
# Covariance scheme
# Definition of the prior for 3 tests: 
# TP :    True Prevalence 
# SE[1] : Sensitity T1 
# SE[2] : Sensitity T2 
# SE[3] : Sensitity T3 
# SP[1] : Specificity T1 
# SP[2] : Specificity T2 
# SP[3] : Specificity T3 
# a[1] :  Covariance(T1,T2|D+) 
# a[2] :  Covariance(T1,T3|D+) 
# a[3] :  Covariance(T2,T3|D+) 
# a[4] :  Covariance(T1,T2,T3|D+) 
# b[1] :  Covariance(T1,T2|D-) 
# b[2] :  Covariance(T1,T3|D-) 
# b[3] :  Covariance(T2,T3|D-) 
# b[4] :  Covariance(T1,T2,T3|D-)



