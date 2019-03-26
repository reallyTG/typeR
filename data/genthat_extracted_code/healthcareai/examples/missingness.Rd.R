library(healthcareai)


### Name: missingness
### Title: Find missingness in each column and search for strings that
###   might represent missing values
### Aliases: missingness

### ** Examples

d <- data.frame(x = c("a", "nil", "b"),
                y = c(1, NaN, 3),
                z = c(1:2, NA))
missingness(d)
missingness(d) %>% plot()



