library(CUFF)


### Name: printcross
### Title: Crosstabs print methods
### Aliases: print.cross
### Keywords: table cross

### ** Examples

require(CUFF)
### example of crosstabs
cr1 <- cross( ~ N + P, npk)
print(cr1, test = c("chisq.test", "fisher.test"))



