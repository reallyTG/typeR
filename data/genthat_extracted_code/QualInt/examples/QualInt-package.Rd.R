library(QualInt)


### Name: QualInt-package
### Title: R-package for qualitative interaction test
### Aliases: QualInt-package

### ** Examples

test9 <- qualval(effect = c(1.0, 0.5, -2.0), se = c(0.86, 0.64, 0.32))
print(test9)
plot(test9)

#### Continuous ####
ynorm <- rnorm(300)
trtment <- sample(c(0, 1), 300, prob = c(0.4, 0.6),
                  replace = TRUE)
subgrp <- sample(c(0, 1, 2), 300, prob = c(1/3, 1/3, 1/3),
                 replace = TRUE)
test1 <- qualint(ynorm, trtment, subgrp)
test2 <- qualint(ynorm, trtment, subgrp, test = "LRT")
plot(test1)
print(test1)
coef(test1)
ibga(test1)

#### Binary ####
ybin <- sample(c(0, 1), 300, prob = c(0.3, 0.7),
               replace = TRUE)
test4 <- qualint(ybin, trtment, subgrp, type = "binary")

#### Survival ####
time <- rpois(300, 200)
censor <- sample(c(0, 1), 300, prob = c(0.7, 0.3),
                 replace = TRUE)
test6 <- qualint(Surv(time, censor), trtment, subgrp)



