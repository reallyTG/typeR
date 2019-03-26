library(tidystats)


### Name: tidy_stats.htest
### Title: Create a tidy stats data frame from an htest object
### Aliases: tidy_stats.htest

### ** Examples

# Conduct a t-test
model_t_test <- t.test(extra ~ group, data = sleep)
tidy_stats(model_t_test)

# Conduct a correlation
x <- c(44.4, 45.9, 41.9, 53.3, 44.7, 44.1, 50.7, 45.2, 60.1)
y <- c( 2.6,  3.1,  2.5,  5.0,  3.6,  4.0,  5.2,  2.8,  3.8)

model_correlation <- cor.test(x, y)
tidy_stats(model_correlation)

# Conduct a chi-square test
M <- as.table(rbind(c(762, 327, 468), c(484, 239, 477)))

model_chi_square <- chisq.test(M)
tidy_stats(model_chi_square)




