library(CUFF)


### Name: cross
### Title: Crosstabs
### Aliases: cross
### Keywords: table cross

### ** Examples

require(CUFF)
### example of crosstabs
cr1 <- cross( ~ N + P, npk)
print(cr1, test = c("chisq.test", "fisher.test"))



