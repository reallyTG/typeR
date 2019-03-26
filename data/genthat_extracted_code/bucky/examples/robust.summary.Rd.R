library(bucky)


### Name: robust.summary
### Title: Robust summary
### Aliases: robust.summary summary.robustified
### Keywords: robust cluster htest

### ** Examples

## With clustering
clotting <- data.frame(
    cl = 1:9,
    u = c(5,10,15,20,30,40,60,80,100),
    lot = c(118,58,42,35,27,25,21,19,18,
            69,35,26,21,18,16,13,12,12))
clot.model <- glm(lot ~ log(u), data = clotting, family = Gamma)
robust.summary(clot.model, cluster=cl)

## Without clustering
data(swiss)
model1 <- lm(Fertility ~ ., data = swiss)
robust.summary(model1)
model1r <- robustify(model1)
summary(model1r)



