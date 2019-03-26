library(CIplot)


### Name: print.ORci
### Title: Print Methods for Odds Ratios and their Confidence Intervals of
###   'ORci' object
### Aliases: print.ORci

### ** Examples

require(MASS)
data(birthwt)
x <- glm(low ~  age + lwt + smoke + ptl + ht + ui, data = birthwt,
         family = binomial)
OR1 <- ORci(x)
print(OR1, digits = 3)




