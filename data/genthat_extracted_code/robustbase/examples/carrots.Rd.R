library(robustbase)


### Name: carrots
### Title: Insect Damages on Carrots
### Aliases: carrots
### Keywords: datasets

### ** Examples

data(carrots)
str(carrots)
plot(success/total ~ logdose, data = carrots, col = as.integer(block))
coplot(success/total ~ logdose | block, data = carrots)

## Classical glm
Cfit0 <- glm(cbind(success, total-success) ~ logdose + block,
             data=carrots, family=binomial)
summary(Cfit0)

## Robust Fit (see help(glmrob)) ....



