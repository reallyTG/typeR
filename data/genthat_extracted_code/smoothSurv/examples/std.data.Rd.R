library(smoothSurv)


### Name: std.data
### Title: Standardization of the Data
### Aliases: std.data
### Keywords: manip

### ** Examples

variable1 <- rnorm(30)
variable2 <- rbinom(30, 1, 0.4)
variable3 <- runif(30)
data.example <- data.frame(variable1, variable2, variable3)
## We standardize only the first and the third column.
data.std <- std.data(data.example, c("variable1", "variable3"))
print(data.std)
print(c(mean(data.std$variable1), sd(data.std$variable1)))
print(c(mean(data.std$variable3), sd(data.std$variable3)))



