library(epiR)


### Name: epi.herdtest
### Title: Estimate herd test characteristics
### Aliases: epi.herdtest
### Keywords: univar univar

### ** Examples

## EXAMPLE 1:
## We wish to estimate the herd-level sensitivity and specificity of 
## a testing regime using an individual animal test of sensitivity 0.391 
## and specificity 0.964. The estimated true prevalence of disease is 0.12.
## Assume that 60 individuals will be tested per herd and we have
## specified that two or more positive test results identify the herd
## as positive.

epi.herdtest(se = 0.391, sp = 0.964, P = 0.12, N = 1E06, n = 60, k = 2)

## This testing regime gives a herd sensitivity of 0.95 and a herd
## specificity of 0.36. With a herd sensitivity of 0.95 we can be
## confident that we will declare a herd infected if it is infected.
## With a herd specficity of only 0.36, we will declare 0.64 of disease
## negative herds as infected, so false positives are a problem.



