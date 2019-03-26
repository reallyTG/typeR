library(varbin)


### Name: varbin.convert
### Title: varbin.convert
### Aliases: varbin.convert

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

# Split train/test
df_train <- df[1:5000, ]
df_test <- df[5001:nrow(df), ]

# Perform unrestricted binnings
result <- varbin.factor(df_train, "educ", "target")
result2 <- varbin(df_train, "age", "target")

# Convert test data
df_new <- varbin.convert(rbind(df_train, df_test), result,"educ")
df_new <- varbin.convert(df_new, result2, "age")



