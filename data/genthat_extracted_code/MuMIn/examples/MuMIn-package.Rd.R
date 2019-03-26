library(MuMIn)


### Name: MuMIn-package
### Title: Multi-model inference
### Aliases: MuMIn-package MuMIn
### Keywords: package models

### ** Examples

## Don't show: 
oop <- 
## End(Don't show)
options(na.action = "na.fail") #  change the default "na.omit" to prevent models 
                               #  from being fitted to different datasets in 
                               #  case of missing values.

fm1 <- lm(y ~ ., data = Cement)
ms1 <- dredge(fm1)

# Visualize the model selection table:
## Don't show: 
 if(require(graphics)) { 
## End(Don't show)
par(mar = c(3,5,6,4))
plot(ms1, labAsExpr = TRUE)
## Don't show: 
 } 
## End(Don't show)
model.avg(ms1, subset = delta < 4)

confset.95p <- get.models(ms1, cumsum(weight) <= .95)
avgmod.95p <- model.avg(confset.95p)
summary(avgmod.95p)
confint(avgmod.95p)
## Don't show: 
options(oop)
## End(Don't show)



