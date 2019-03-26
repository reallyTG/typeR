library(plm)


### Name: pwartest
### Title: Wooldridge Test for AR(1) Errors in FE Panel Models
### Aliases: pwartest pwartest.panelmodel pwartest.formula
### Keywords: htest

### ** Examples

data("EmplUK", package = "plm")
pwartest(log(emp) ~ log(wage) + log(capital), data = EmplUK)

# pass argument 'type' to vcovHC used in test
pwartest(log(emp) ~ log(wage) + log(capital), data = EmplUK, type = "HC3")




