library(drc)


### Name: lettuce
### Title: Hormesis in lettuce plants
### Aliases: lettuce
### Keywords: datasets

### ** Examples


## Look at data
lettuce

## Monotonous dose-response model
lettuce.m1 <- drm(weight~conc, data=lettuce, fct=LL.3())

plot(lettuce.m1, broken = TRUE)

## Model fit in van Ewijk and Hoekstra (1994)
lettuce.m2 <- drm(weight~conc, data=lettuce, fct=BC.4())
modelFit(lettuce.m2)

plot(lettuce.m2, add = TRUE, broken = TRUE, type = "none", lty = 2)

## Hormesis effect only slightly significant
summary(lettuce.m2)

## Hormesis effect highly significant
##  compare with t-test for the "f" parameter in the summary output)
anova(lettuce.m1, lettuce.m2)




