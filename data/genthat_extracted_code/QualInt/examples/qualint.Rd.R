library(QualInt)


### Name: qualint
### Title: Test for qualitative interactions from complete data
### Aliases: qualint

### ** Examples

#### Continuous ####
ynorm <- rnorm(300)
trtment <- sample(c(0, 1), 300, prob = c(0.4, 0.6),
                 replace = TRUE)
subgrp <- sample(c(0, 1, 2), 300, prob = c(1/3, 1/3, 1/3),
                 replace = TRUE)
test1 <- qualint(ynorm, trtment, subgrp)
plot(test1)
print(test1)
coef(test1)
test2 <- qualint(ynorm, trtment, subgrp, plotout = TRUE)
test3 <- qualint(ynorm, trtment, subgrp, test = "LRT")

#### Binary ####
ybin <- sample(c(0, 1), 300, prob = c(0.3, 0.7),
               replace = TRUE)
test4 <- qualint(ybin, trtment, subgrp, type = "binary")
test5 <- qualint(ybin, trtment, subgrp, type = "binary",
                 scale = "RR", test = "LRT")

#### Survival ####
time <- rpois(300, 200)
censor <- sample(c(0, 1), 300, prob = c(0.7, 0.3),
                 replace = TRUE)
test6 <- qualint(Surv(time, censor), trtment, subgrp)
test7 <- qualint(Surv(time, censor), trtment, subgrp,
                 type = "survival", test = "LRT")
test8 <- qualint(Surv(time, censor), trtment, subgrp,
                 test = "IBGA", plotout = TRUE)



