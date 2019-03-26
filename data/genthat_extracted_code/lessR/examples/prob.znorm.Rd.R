library(lessR)


### Name: prob.znorm
### Title: Plot a Normal Curve with Shaded Intervals by Standard Deviation
### Aliases: prob.znorm
### Keywords: probability

### ** Examples

# Mu=0, Sigma=1: Standard normal 
prob.znorm()

# distribution for height of American women, mu=65.5, sigma=2.5
prob.znorm(65.5, 2.5, xlab="Height of American Women")

# do a red fill color
prob.znorm(65.5, 2.5, r=.9, xlab="Height of American Women")



