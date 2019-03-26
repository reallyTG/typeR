library(onewaytests)


### Name: paircomp
### Title: Pairwise Comparisons
### Aliases: paircomp paircomp.default paircomp.owt
### Keywords: functions

### ** Examples


library(onewaytests)

out <- aov.test(Sepal.Length ~ Species, data = iris)
paircomp(out)
paircomp(out, adjust.method = "hochberg")

out2 <- kw.test(Sepal.Length ~ Species, data = iris)
paircomp(out2)
paircomp(out2, adjust.method = "hommel")

out3 <- kw.test(Sepal.Length ~ Species, data = iris)
paircomp(out3)
paircomp(out3, adjust.method = "holm")





