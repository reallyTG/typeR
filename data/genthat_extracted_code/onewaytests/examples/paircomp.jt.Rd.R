library(onewaytests)


### Name: paircomp.jt
### Title: Pairwise Comparisons for James Second Order Test
### Aliases: paircomp.jt
### Keywords: functions

### ** Examples


library(onewaytests)

out <- james.test(Sepal.Length ~ Species, data = iris, alpha = 0.05)
paircomp(out, adjust.method = "bonferroni")




