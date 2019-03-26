library(aods3)


### Name: splitbin
### Title: Split Grouped Data Into Individual Data
### Aliases: splitbin
### Keywords: datagen

### ** Examples

# grouped data with weights
z <- data.frame(
    m = c(0, 1, 0, 1),
    f1 = c("A", "A", "B", "B"),
    f2 = c("C", "D", "C", "D"),
    n = c(4, 2, 1, 3)
    )
z
splitbin(formula = n ~ f1, data = z)$tab
splitbin(formula = n ~ f1 + f2 + m , data = z)$tab

# grouped data of form "cbind(success, failure)"
z <- data.frame(
    m = c(4, 1),
    n = c(5, 3),
    f1 = c("A", "B"),
    f2 = c("C", "D")
    )
z
splitbin(formula = cbind(m, n - m) ~ 1, data = z)$tab
splitbin(formula = cbind(m, n - m) ~ f1 + f2, data = z)$tab
splitbin(formula = cbind(m, n - m) ~ f1 + f2, data = z)$tab



