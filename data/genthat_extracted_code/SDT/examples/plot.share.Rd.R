library(SDT)


### Name: plot.share
### Title: Plot Method for Objects of Class share
### Aliases: plot.share
### Keywords: hplot methods

### ** Examples

## attach dataset to search path (to use variable names)
attach(learning_motivation)

## internalization plot
(ijr <- internalization(introjected, intrinsic, external))
## with generic labels
plot(ijr)
## with user-specified convenient labels
plot(ijr, target = "introjected regulation",
     reference = c("intrinsic regulation", "external regulation"))

## simplex structure plot 1
(simstr2 <- simplex(target_regulation = external, base_regulation_1 = intrinsic,
                    base_regulation_2 = identified, base_regulation_3 = introjected))
## with generic labels
plot(simstr2)
## with user-specified convenient labels
plot(simstr2, target = "external regulation",
     reference = c("intrinsic regulation", "identified regulation", "introjected regulation"))

## simplex structure plot 2
## different target variable and reference system, conveniently labeled
plot(simplex(identified, intrinsic, introjected, external), target = "identified regulation",
     reference = c("intrinsic regulation", "introjected regulation", "external regulation"))



