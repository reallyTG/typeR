library(varbin)


### Name: varbin.monotonic
### Title: varbin.monotonic
### Aliases: varbin.monotonic

### ** Examples

# Set seed and generate data
set.seed(1337)
target <- as.numeric(runif(10000, 0, 1)<0.2)
age <- round(rnorm(10000, 40, 15), 0)
age[age<20] <- round(rnorm(sum(age<20), 40, 5), 0)
age[age>95] <- round(rnorm(sum(age>95), 40, 5), 0)
inc <- round(rnorm(10000, 100000, 10000), 0)
educ <- sample(c("MSC", "BSC", "SELF", "PHD", "OTHER"), 10000, replace=TRUE)
df <- data.frame(target=target, age=age, inc=inc, educ=educ)

# Perform monotonically restricted binning
result <- varbin.monotonic(df, "inc", "target")



