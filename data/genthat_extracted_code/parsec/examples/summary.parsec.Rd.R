library(parsec)


### Name: summary.parsec
### Title: Summary of outputs of the evaluation function.
### Aliases: summary.parsec

### ** Examples

profiles <- var2prof(varlen = c(3, 2, 4))
threshold <- c("311", "112")

res <- evaluation(profiles, threshold, nit = 10^3)

sm <- summary(res)
summary(sm)



