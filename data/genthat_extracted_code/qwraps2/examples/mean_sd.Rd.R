library(qwraps2)


### Name: mean_sd
### Title: Mean and Standard deviation
### Aliases: mean_sd gmean_sd

### ** Examples

set.seed(42)
x <- rnorm(1000, 3, 4)
mean(x)
sd(x)
mean_sd(x)
mean_sd(x, show_n = "always")
mean_sd(x, show_n = "always", denote_sd = "paren")

x[187] <- NA
mean_sd(x, na_rm = TRUE)




