library(parsec)


### Name: idn
### Title: Multidimensional evaluation on posets (Identification Function
###   only)
### Aliases: idn C_bd_simp

### ** Examples

profiles <- var2prof(varlen = c(3, 2, 4))
threshold <- c("311", "112")

res <- idn(profiles, threshold, maxint = 10^5)

summary(res)
plot(res)



