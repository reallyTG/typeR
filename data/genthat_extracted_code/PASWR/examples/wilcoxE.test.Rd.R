library(PASWR)


### Name: wilcoxE.test
### Title: Wilcox Exact Test
### Aliases: wilcoxE.test
### Keywords: htest

### ** Examples

# Wilcoxon Signed Rank Test - Example 10.3
PH <- c(7.2,7.3,7.3,7.4)
wilcoxE.test(PH, mu=7.25, alternative="greater")
# Wilcoxon Signed Rank Test (Dependent Samples) - Example 10.5 part c.
with(data = Aggression,
wilcoxE.test(violence,noviolence,paired=TRUE,alternative="greater"))
# Wilcoxon Rank Sum Test - Example 10.7
x <- c(7.2,7.2,7.3,7.3)
y <- c(7.3,7.3,7.4,7.4)
wilcoxE.test(x,y)
rm(PH, x, y)



