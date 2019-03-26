library(broom)


### Name: summary_tidiers
### Title: Tidy/glance a(n) summaryDefault object
### Aliases: summary_tidiers tidy.summaryDefault glance.summaryDefault

### ** Examples


v <- rnorm(1000)
s <- summary(v)
s

tidy(s)
glance(s)

v2 <- c(v,NA)
tidy(summary(v2))




