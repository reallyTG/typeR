library(polspline)


### Name: summary.heft
### Title: Heft: hazard estimation with flexible tails
### Aliases: summary.heft print.heft
### Keywords: distribution smooth survival

### ** Examples

fit1 <- heft(testhare[,1], testhare[,2])
summary(fit1)
# modify tail behavior
fit2 <- heft(testhare[,1], testhare[,2], leftlog = FALSE, rightlog = FALSE, 
    leftlin = TRUE)   
summary(fit2)
fit3 <- heft(testhare[,1], testhare[,2], penalty = 0)   # select largest model
summary(fit3)



