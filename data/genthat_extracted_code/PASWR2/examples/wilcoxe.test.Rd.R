library(PASWR2)


### Name: wilcoxe.test
### Title: Wilcoxon Exact Test
### Aliases: wilcoxe.test
### Keywords: htest

### ** Examples

 
# Wilcoxon Signed Rank Test
PH <- c(7.2, 7.3, 7.3, 7.4)
wilcoxe.test(PH, mu = 7.25, alternative = "greater")
# Wilcoxon Signed Rank Test (Dependent Samples)
with(data = AGGRESSION, 
wilcoxe.test(violence, noviolence, paired = TRUE, alternative = "greater"))
# Wilcoxon Rank Sum Test
x <- c(7.2, 7.2, 7.3, 7.3)
y <- c(7.3, 7.3, 7.4, 7.4)
wilcoxe.test(x, y)
rm(PH, x, y)
 



