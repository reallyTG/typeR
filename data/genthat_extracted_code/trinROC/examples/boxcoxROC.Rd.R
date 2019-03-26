library(trinROC)


### Name: boxcoxROC
### Title: Box-Cox transformation on three-class ROC data
### Aliases: boxcoxROC

### ** Examples

data(cancer)
x1 <- with(cancer, cancer[trueClass=="healthy", 9])
y1 <- with(cancer, cancer[trueClass=="intermediate", 9])
z1 <- with(cancer, cancer[trueClass=="diseased", 9])

boxcoxROC(x1, y1, z1)



