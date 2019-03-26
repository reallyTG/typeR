library(plm)


### Name: pwfdtest
### Title: Wooldridge first-difference-based test for AR(1) errors in
###   levels or first-differenced panel models
### Aliases: pwfdtest pwfdtest.formula pwfdtest.panelmodel
### Keywords: htest

### ** Examples

data("EmplUK" , package = "plm")
pwfdtest(log(emp) ~ log(wage) + log(capital), data = EmplUK)
pwfdtest(log(emp) ~ log(wage) + log(capital), data = EmplUK, h0 = "fe")

# pass argument 'type' to vcovHC used in test
pwfdtest(log(emp) ~ log(wage) + log(capital), data = EmplUK, type = "HC3", h0 = "fe")


# same with panelmodel interface
mod <- plm(log(emp) ~ log(wage) + log(capital), data = EmplUK, model = "fd")
pwfdtest(mod)
pwfdtest(mod, h0 = "fe")
pwfdtest(mod, type = "HC3", h0 = "fe")




