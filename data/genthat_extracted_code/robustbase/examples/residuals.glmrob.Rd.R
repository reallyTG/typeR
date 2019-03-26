library(robustbase)


### Name: residuals.glmrob
### Title: Residuals of Robust Generalized Linear Model Fits
### Aliases: residuals.glmrob
### Keywords: models regression

### ** Examples

### -------- Gamma family -- data from example(glm) ---
clotting <- data.frame(
            u = c(5,10,15,20,30,40,60,80,100),
         lot1 = c(118,58,42,35,27,25,21,19,18),
         lot2 = c(69,35,26,21,18,16,13,12,12))
summary(cl <- glm   (lot1 ~ log(u), data=clotting, family=Gamma))
summary(ro <- glmrob(lot1 ~ log(u), data=clotting, family=Gamma))
clotM5.high <- within(clotting, { lot1[5] <- 60 })
cl5.high <- glm   (lot1 ~ log(u), data=clotM5.high, family=Gamma)
ro5.high <- glmrob(lot1 ~ log(u), data=clotM5.high, family=Gamma)
rr <- range(residuals(ro), residuals(cl), residuals(ro5.high))
plot(residuals(ro5.high) ~ residuals(cl5.high), xlim = rr, ylim = rr, asp = 1)
abline(0,1, col=2, lty=3)
points(residuals(ro) ~ residuals(cl), col = "gray", pch=3)

## Show all kinds of residuals:
r.types <- c("deviance", "pearson", "working", "response")
sapply(r.types, residuals, object = ro5.high)



