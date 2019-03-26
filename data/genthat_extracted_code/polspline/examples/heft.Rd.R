library(polspline)


### Name: heft
### Title: Heft: hazard estimation with flexible tails
### Aliases: heft
### Keywords: distribution smooth survival

### ** Examples

fit1 <- heft(testhare[,1], testhare[,2])
# modify tail behavior
fit2 <- heft(testhare[,1], testhare[,2], leftlog = FALSE, rightlog = FALSE, 
          leftlin = TRUE)   
fit3 <- heft(testhare[,1], testhare[,2], penalty = 0)   # select largest model



