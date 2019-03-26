library(ihs)


### Name: ihs
### Title: The Inverse Hyperbolic Sine Distribution
### Aliases: IHS ihs dihs pihs qihs rihs
### Keywords: distribution

### ** Examples

require(graphics)

### This shows how default values of the IHS compare
### to a standard normal.
x = seq(-5,5,by=0.05)
plot(x, dnorm(x), type='l')
lines(x, dihs(x), col='blue')

pihs(0)
pihs(0, lambda = -0.5)



