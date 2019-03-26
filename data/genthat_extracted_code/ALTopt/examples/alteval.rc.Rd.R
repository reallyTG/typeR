library(ALTopt)


### Name: alteval.rc
### Title: Design evaluation with right censoring.
### Aliases: alteval.rc

### ** Examples

# Evaluation of factorial design for right censoring.
x1 <- c(0, 1, 0, 1)
x2 <- c(0, 0, 1, 1)
allocation <- c(25, 25, 25, 25)
facDes <- data.frame(x1, x2, allocation)

alteval.rc(facDes, "D", 100, 2, 1, formula = ~ x1 + x2 + x1:x2,
coef = c(0, -4.086, -1.476, 0.01))

alteval.rc(facDes, "U", 100, 2, 1, formula = ~ x1 + x2 + x1:x2,
coef = c(0, -4.086, -1.476, 0.01), useCond = c(1.758, 3.159))

alteval.rc(facDes, "I", 100, 2, 1, formula = ~ x1 + x2 + x1:x2,
coef = c(0, -4.086, -1.476, 0.01), useLower = c(1.458, 2.859), useUpper = c(2.058, 3.459))



