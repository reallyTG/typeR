library(plm)


### Name: sargan
### Title: Hansen-Sargan Test of Overidentifying Restrictions
### Aliases: sargan
### Keywords: htest

### ** Examples

data("EmplUK", package = "plm")
ar <- pgmm(log(emp) ~ lag(log(emp), 1:2) + lag(log(wage), 0:1) +
           lag(log(capital), 0:2) + lag(log(output), 0:2) | lag(log(emp), 2:99),
           data = EmplUK, effect = "twoways", model = "twosteps")
sargan(ar)



