library(gginference)


### Name: ggchisqtest
### Title: Plot for Pearson's Chi-squared Test for Count Data
### Aliases: ggchisqtest

### ** Examples

## Chi-squared test for given probabilities

x <- c(A = 20, B = 15, C = 25)
chisq_test <- chisq.test(x)
chisq_test
ggchisqtest(chisq_test)


x <- c(10, 86, 45, 38, 10)
p <- c(0.10, 0.40, 0.20, 0.20, 0.10)
chisq_test2 <- chisq.test(x, p = p)
chisq_test2
ggchisqtest(chisq_test2)



## Pearson's Chi-squared test

library(MASS)
sex_smoke <- table(survey$Sex, survey$Smoke)
chisq_test3 <- chisq.test(sex_smoke)
chisq_test3
ggchisqtest(chisq_test3)




