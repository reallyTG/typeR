library(intrval)


### Name: ovrlap
### Title: Relational Operators Comparing Two Intervals
### Aliases: overlap %[o]% %)o(% %[<o]% %[o>]% %(o)% %]o[% %(<o)% %(o>)%
###   %[]o[]% %[]o[)% %[]o(]% %[]o()% %[)o[]% %[)o[)% %[)o(]% %[)o()%
###   %(]o[]% %(]o[)% %(]o(]% %(]o()% %()o[]% %()o[)% %()o(]% %()o()%
### Keywords: manip logic

### ** Examples

## motivating examples from example(lm)

## Annette Dobson (1990) "An Introduction to Generalized Linear Models".
## Page 9: Plant Weight Data.
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D90 <- lm(weight ~ group - 1) # omitting intercept
## compare 95% confidence of the 2 groups to each other
(CI.D90 <- confint(lm.D90))
CI.D90[1,] %[o]% CI.D90[2,]

## simple interval comparisons
c(2:3) %[o]% c(0:1)

## vectorized comparisons
c(2:3) %[o]% list(0:4, 1:5)
c(2:3) %[o]% cbind(0:4, 1:5)
c(2:3) %[o]% data.frame(a=0:4, b=1:5)
list(0:4, 1:5) %[o]% c(2:3)
cbind(0:4, 1:5) %[o]% c(2:3)
data.frame(a=0:4, b=1:5) %[o]% c(2:3)

list(0:4, 1:5) %[o]% cbind(rep(2,5), rep(3,5))
cbind(rep(2,5), rep(3,5)) %[o]% list(0:4, 1:5)

cbind(rep(3,5),rep(4,5)) %)o(% cbind(1:5, 2:6)
cbind(rep(3,5),rep(4,5)) %[<o]% cbind(1:5, 2:6)
cbind(rep(3,5),rep(4,5)) %[o>]% cbind(1:5, 2:6)

## open intervals

list(0:4, 1:5) %(o)% cbind(rep(2,5), rep(3,5))
cbind(rep(2,5), rep(3,5)) %(o)% list(0:4, 1:5)

cbind(rep(3,5),rep(4,5)) %]o[% cbind(1:5, 2:6)
cbind(rep(3,5),rep(4,5)) %(<o)% cbind(1:5, 2:6)
cbind(rep(3,5),rep(4,5)) %(o>)% cbind(1:5, 2:6)

dt1 <- as.Date(c("2000-01-01", "2000-03-15"))
dt2 <- as.Date(c("2000-03-15", "2000-06-07"))

dt1 %[]o[]% dt2
dt1 %[]o[)% dt2
dt1 %[]o(]% dt2
dt1 %[]o()% dt2
dt1 %[)o[]% dt2
dt1 %[)o[)% dt2
dt1 %[)o(]% dt2
dt1 %[)o()% dt2
dt1 %(]o[]% dt2
dt1 %(]o[)% dt2
dt1 %(]o(]% dt2
dt1 %(]o()% dt2
dt1 %()o[]% dt2
dt1 %()o[)% dt2
dt1 %()o(]% dt2
dt1 %()o()% dt2



