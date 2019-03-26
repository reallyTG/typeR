library(HPbayes)


### Name: mod8p
### Title: Heligman-Pollard parameter coversion to age-specific
###   probabilites of death
### Aliases: mod8p
### Keywords: misc

### ** Examples

theta <- c(0.06008, 0.31087, 0.34431, 0.00698,
           1.98569, 26.71071, 0.00022, 1.08800)
age <- c(0.00001, 1, seq(5, 85, 5))
result <- mod8p(theta=theta, x=age)




