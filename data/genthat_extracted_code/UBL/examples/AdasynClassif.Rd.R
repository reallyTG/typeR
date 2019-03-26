library(UBL)


### Name: AdasynClassif
### Title: ADASYN algorithm for unbalanced classification problems, both
###   binary and multi-class.
### Aliases: AdasynClassif
### Keywords: pre-processing classification

### ** Examples

# Example with an imbalanced multi-class problem
 data(iris)
 dat <- iris[-c(45:75), c(1, 2, 5)]
# checking the class distribution of this artificial data set
 table(dat$Species)
 newdata <- AdasynClassif(Species~., dat, beta=1)
 table(newdata$Species)
 beta <- list("setosa"=1, "versicolor"=0.5)
 newdata <- AdasynClassif(Species~., dat, baseClass="virginica", beta=beta)
 table(newdata$Species)

## Checking visually the created data
par(mfrow = c(1, 2))
plot(dat[, 1], dat[, 2], pch = 19 + as.integer(dat[, 3]),
     col = as.integer(dat[,3]), main = "Original Data",
     xlim=range(newdata[,1]), ylim=range(newdata[,2]))
plot(newdata[, 1], newdata[, 2], pch = 19 + as.integer(newdata[, 3]),
     col = as.integer(newdata[,3]), main = "New Data",
     xlim=range(newdata[,1]), ylim=range(newdata[,2]))

# A binary example
library(MASS)
data(cats)
table(cats$Sex)
Ada1cats <- AdasynClassif(Sex~., cats)
table(Ada1cats$Sex)
Ada2cats <- AdasynClassif(Sex~., cats, beta=5)
table(Ada2cats$Sex)




