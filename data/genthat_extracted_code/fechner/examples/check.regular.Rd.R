library(fechner)


### Name: check.regular
### Title: Check for Regular Minimality/Maximality
### Aliases: check.regular
### Keywords: manip utilities

### ** Examples

## dataset wish satisfies regular minimality in canonical form
check.regular(wish)

## dataset regMin satisfies regular minimality in non-canonical
## form and so is canonically transformed and relabeled
regMin
check.regular(regMin)

## dataset noRegMin does satisfy neither regular minimality nor
## regular maximality
check.regular(noRegMin, type = "probability.different")
check.regular(noRegMin, type = "reg.maximal")

## dataset morse satisfies regular maximality in canonical form
check.regular(morse, type = "percent.same")
## part of morse data satisfies regular maximality
check.regular(morse[c(2, 27:36), c(2, 27:36)], type = "reg.maximal")



