library(broom)


### Name: tidy.ts
### Title: Tidy a(n) ts object
### Aliases: tidy.ts

### ** Examples


set.seed(678)

tidy(ts(1:10, frequency = 4, start = c(1959, 2)))

z <- ts(matrix(rnorm(300), 100, 3), start = c(1961, 1), frequency = 12)
colnames(z) <- c("Aa", "Bb", "Cc")
tidy(z)




