library(plm)


### Name: dynformula
### Title: Dynamic Formula
### Aliases: dynformula print.dynformula formula.dynformula
### Keywords: classes

### ** Examples

# all variables in log, x1, x2 and x3 laged twice, y laged once and x3 differenced
z <- dynformula(y ~ x1 + x2 + x3, lag.form = list(2, y = 1),
                diff.form = c(x3 = TRUE), log.form = TRUE)
formula(z)



