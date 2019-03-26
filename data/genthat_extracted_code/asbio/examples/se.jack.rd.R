library(asbio)


### Name: se.jack
### Title: Jackknife standard error from a set of pseudovalues
### Aliases: se.jack se.jack1

### ** Examples

trag <- c(59, 49, 75, 43, 94, 68, 77, 78, 63, 71, 31, 59, 53, 48, 65, 73, 50, 59, 50, 57)
p <- pseudo.v(trag, statistic = mean)
se.jack(p[,2])



