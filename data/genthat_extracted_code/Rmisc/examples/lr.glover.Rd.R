library(Rmisc)


### Name: lr.glover
### Title: Likelihood Ratio Test
### Aliases: lr.glover

### ** Examples

m1 <- lm(mpg~.,mtcars)
m2 <- step(m1,~.,trace=0)
m3 <- step(m1,~.+.^2,trace=0)
lr.glover(m1,m2,m3)



