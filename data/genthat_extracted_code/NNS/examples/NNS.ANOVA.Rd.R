library(NNS)


### Name: NNS.ANOVA
### Title: NNS ANOVA
### Aliases: NNS.ANOVA
### Keywords: ANOVA, effect size

### ** Examples

### Binary analysis and effect size
set.seed(123)
x <- rnorm(100) ; y <- rnorm(100)
NNS.ANOVA(control = x, treatment = y)

### Two variable analysis with no control variable
A <- cbind(x, y)
NNS.ANOVA(A)

### Multiple variable analysis with no control variable
set.seed(123)
x <- rnorm(100) ; y<- rnorm(100) ; z<- rnorm(100)
A <- cbind(x, y, z)
NNS.ANOVA(A)



