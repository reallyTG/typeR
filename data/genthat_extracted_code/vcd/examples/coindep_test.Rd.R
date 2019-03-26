library(vcd)


### Name: coindep_test
### Title: Test for (Conditional) Independence
### Aliases: coindep_test fitted.coindep_test
### Keywords: htest

### ** Examples

library(MASS)
TeaTasting <- matrix(c(3, 1, 1, 3), nr = 2,
                     dimnames = list(Guess = c("Milk", "Tea"),
                                     Truth = c("Milk", "Tea"))
)
## compute maximum statistic
coindep_test(TeaTasting)
## compute Chi-squared statistic
coindep_test(TeaTasting, indepfun = function(x) sum(x^2))
## use unconditional asymptotic distribution
chisq.test(TeaTasting, correct = FALSE)
chisq.test(TeaTasting)


data("UCBAdmissions")
## double maximum statistic
coindep_test(UCBAdmissions, margin = "Dept")
## maximum of Chi-squared statistics
coindep_test(UCBAdmissions, margin = "Dept", indepfun = function(x) sum(x^2))
## Pearson Chi-squared statistic
coindep_test(UCBAdmissions, margin = "Dept", indepfun = function(x) sum(x^2), aggfun = sum)
## use unconditional asymptotic distribution
loglm(~ Dept * (Gender + Admit), data = UCBAdmissions)



