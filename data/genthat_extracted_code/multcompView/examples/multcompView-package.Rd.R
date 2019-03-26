library(multcompView)


### Name: multcompView-package
### Title: Summarize multiple paired comparisons
### Aliases: multcompView multcompView-package
### Keywords: aplot dplot htest package

### ** Examples

dif3 <- c(FALSE, FALSE, TRUE)
names(dif3) <- c("a-b", "a-c", "b-c")
multcompTs(dif3)
multcompLetters(dif3)

library(MASS)
multcompBoxplot(Postwt~Treat, data=anorexia)



