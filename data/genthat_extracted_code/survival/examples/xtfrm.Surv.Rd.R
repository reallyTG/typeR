library(survival)


### Name: xtfrm.Surv
### Title: Sorting order for Surv objects
### Aliases: xtfrm.Surv sort.Surv order.Surv
### Keywords: survival

### ** Examples

test <- c(Surv(c(10, 9,9, 8,8,8,7,5,5,4), rep(1:0, 5)), Surv(6.2, NA))
test
sort(test)



