library(CUFF)


### Name: freq
### Title: Frequencies
### Aliases: freq print.frequencies
### Keywords: freq frequencies

### ** Examples

require(CUFF)
### example of crosstabs
fr1 <- freq( ~ N + P, npk, c("Nitrogen", "Phosphate"))
fr1
### To use with sweave or knitr.
print(fr1, toLatex = TRUE)



