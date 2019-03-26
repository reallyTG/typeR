library(parsec)


### Name: plot.parsec
### Title: Plot the outputs of the PARSEC function 'evaluation'.
### Aliases: plot.parsec

### ** Examples

profiles <- var2prof(varlen = c(3, 2, 4))
threshold <- c("311", "112")

res <- evaluation(profiles, threshold, nit = 10^3)

plot(res)



