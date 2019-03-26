library(mistat)


### Name: randomizationTest
### Title: Randomization Test
### Aliases: randomizationTest
### Keywords: nonparametric

### ** Examples

data(OELECT)
data(OELECT1)

# test difference in mean:
randomizationTest(list(a=OELECT, b=OELECT1), 
                  R=500, calc=mean, 
                  fun=function(x) x[1]-x[2],
                  seed=123)



