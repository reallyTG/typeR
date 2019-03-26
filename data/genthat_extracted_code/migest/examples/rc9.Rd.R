library(migest)


### Name: rc9
### Title: Rogers-Castro Migration Schedule
### Aliases: rc9

### ** Examples

# single age groups
x <- 1:100
m <- rc9(x, param = rc9.fund)
plot(x, m, type="l")

# 5 year age groups
m <- rc9(x, param = rc9.fund)
plot(x, m, type="l")



