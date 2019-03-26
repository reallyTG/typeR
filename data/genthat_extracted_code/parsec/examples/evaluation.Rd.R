library(parsec)


### Name: evaluation
### Title: Multidimensional evaluation on posets
### Aliases: evaluation C_bd C_linzeta

### ** Examples

profiles <- var2prof(varlen = c(3, 2, 2))
threshold <- c("311", "112")

res <- evaluation(profiles, threshold, maxint = 10^5)

summary(res)
plot(res)



