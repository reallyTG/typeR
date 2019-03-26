library(polspline)


### Name: plot.heft
### Title: Heft: hazard estimation with flexible tails
### Aliases: plot.heft
### Keywords: distribution smooth survival

### ** Examples

fit1 <- heft(testhare[,1], testhare[,2])
plot(fit1, what = "h")
# modify tail behavior
fit2 <- heft(testhare[,1], testhare[,2], leftlog = FALSE, rightlog = FALSE, 
    leftlin = TRUE)   
plot(fit2, what = "h", add = TRUE,lty = 2)
fit3 <- heft(testhare[,1], testhare[,2], penalty = 0)   # select largest model
plot(fit3, what = "h", add = TRUE,lty = 3)



