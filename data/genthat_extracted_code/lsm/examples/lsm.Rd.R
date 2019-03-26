library(lsm)


### Name: lsm
### Title: Estimation of the log Likelihood of the Saturated Model
### Aliases: lsm

### ** Examples

# Hosmer, D. (2013) page 3: Age and coranary Heart Disease (CHD) Status of 20 subjects:

AGE <- c(20, 23, 24, 25, 25, 26, 26, 28, 28, 29, 30, 30, 30, 30, 30, 30, 30, 32, 33, 33)
CHD <- c(0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0)

 data <- data.frame (CHD, AGE)
 lsm(CHD ~ AGE , data)

# Other case.

 y <- c(0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1)
 x1 <- c(2, 2, 2, 2, 2, 5, 5, 5, 5, 6, 6, 6, 8, 8, 11, 11, 11, 1)
 x2 <- c(3, 3, 3, 3, 3, 6, 6, 6, 6, 8, 8, 8, 9, 9, 12, 12, 12, 12)
 x3 <- c(4, 4, 4, 4, 4, 7, 7, 7, 7, 9, 9, 9, 10, 10, 13, 13, 13, 13)
 x4 <- c(1, 1, 1, 1, 1, 9, 9, 9, 9, 10, 10, 10, 4, 4, 2, 2, 2, 2)
 x5 <- c(32, 32, 32, 32, 32, 20, 20, 20, 20, 21, 21, 21, 19, 19, 16, 16, 16, 16)
 x6 <- c(15, 15, 15, 15, 15, 18, 18, 18, 18, 16, 16, 16, 25, 25, 20, 20, 20, 20)
 x7 <- c(28, 28, 28, 28, 28, 23, 23, 23, 23, 32, 32, 32, 24, 24, 32, 32, 32, 32)
 x8 <- c(0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0)
 x9 <- c(6, 6, 6, 6, 6, 10, 10, 10, 10, 11, 11, 11, 7, 7, 21, 21, 21, 21)
 x10 <- c(5, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8)

 data <- data.frame (y, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10)
 lsm(y ~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10, data)

## For more ease, use the following notation.
 lsm(y~., data)

## Other case.

  y <- as.factor(c(1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1))
 x1 <- as.factor(c(2, 2, 2, 5, 5, 5, 5, 8, 8, 11, 11, 11))
 x2 <- as.factor(c(3, 3, 3, 6, 6, 6, 6, 9, 9, 12, 12, 12))
 x3 <- as.factor(c(4, 4, 4, 7, 7, 7, 7, 10, 10, 13, 13, 13))
 x4 <- as.factor(c(1, 1, 1, 9, 9, 9, 9, 4, 4, 2, 2, 2))
 x5 <- as.factor(c(5, 5, 5, 6, 6, 6, 6, 7, 7, 8, 8, 8))

 data <- data.frame (y, x1, x2, x3, x4, x5)
 lsm(y ~ x1 + x2 + x3 + x4 + x5, data)

## For more ease, use the following notation.
 lsm(y~., data)




