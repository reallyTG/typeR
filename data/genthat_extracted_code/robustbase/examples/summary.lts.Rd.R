library(robustbase)


### Name: summary.lts
### Title: Summary Method for LTS objects
### Aliases: summary.lts print.summary.lts
### Keywords: regression robust

### ** Examples

data(Animals2)
ltsA <- ltsReg(log(brain) ~ log(body), data = Animals2)
(slts <- summary(ltsA))
## non-default options for printing the summary:
print(slts, digits = 5, signif.stars = FALSE)



