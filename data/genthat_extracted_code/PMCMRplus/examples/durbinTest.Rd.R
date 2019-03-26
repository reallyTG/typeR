library(PMCMRplus)


### Name: durbinTest
### Title: Durbin Test
### Aliases: durbinTest durbinTest.default

### ** Examples

## Example for an incomplete block design:
## Data from Conover (1999, p. 391).
y <- matrix(c(
2,NA,NA,NA,3, NA,  3,  3,  3, NA, NA, NA,  3, NA, NA,
  1,  2, NA, NA, NA,  1,  1, NA,  1,  1,
NA, NA, NA, NA,  2, NA,  2,  1, NA, NA, NA, NA,
 3, NA,  2,  1, NA, NA, NA, NA,  3, NA,  2,  2
), ncol=7, nrow=7, byrow=FALSE,
dimnames=list(1:7, LETTERS[1:7]))
durbinTest(y)



