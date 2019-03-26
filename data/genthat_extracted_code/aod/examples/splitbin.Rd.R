library(aod)


### Name: splitbin
### Title: Split Grouped Data Into Individual Data
### Aliases: splitbin
### Keywords: datagen

### ** Examples

# Grouped data with weights
mydata <- data.frame(
    success = c(0, 1, 0, 1),
    f1 = c("A", "A", "B", "B"),
    f2 = c("C", "D", "C", "D"),
    n = c(4, 2, 1, 3)
    )
mydata
splitbin(formula = n ~ f1, data = mydata)$tab
splitbin(formula = n ~ f1 + f2 + success , data = mydata)$tab

# Grouped data of form "cbind(success, failure)"
mydata <- data.frame(
    success = c(4, 1),
    failure = c(1, 2),
    f1 = c("A", "B"),
    f2 = c("C", "D")
    )
mydata$n <- mydata$success + mydata$failure
mydata
splitbin(formula = cbind(success, failure) ~ 1, data = mydata)$tab
splitbin(formula = cbind(success, failure) ~ f1 + f2, data = mydata)$tab
splitbin(formula = cbind(success, n - success) ~ f1 + f2, data = mydata)$tab
splitbin(formula = cbind(success, n - 0.5 * failure - success) ~ f1 + f2,
         data = mydata)$tab



