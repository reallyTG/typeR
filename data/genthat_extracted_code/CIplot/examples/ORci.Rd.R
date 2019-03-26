library(CIplot)


### Name: ORci
### Title: Calculate odds ratios and their confidence intervals from 'glm'
###   object
### Aliases: ORci

### ** Examples

require(graphics)
require(MASS)
data(birthwt)
x <- glm(low ~  age + lwt + smoke + ptl + ht + ui, data = birthwt,
         family = binomial)
OR1 <- ORci(x)
CIplot(OR1, las = 1)



