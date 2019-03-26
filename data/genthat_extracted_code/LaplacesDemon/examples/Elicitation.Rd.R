library(LaplacesDemon)


### Name: Elicitation
### Title: Prior Elicitation
### Aliases: delicit elicit
### Keywords: Elicitation Personal Probability Prior Subjective Probability
###   Utility

### ** Examples

library(LaplacesDemon)
x <- c(1,2,2,3,3,3,4,7,8,8,9,10) #Elicited with elicit function
theta <- seq(from=-5,to=15,by=.1)
plot(theta, delicit(theta,x), type="l", xlab=expression(theta),
     ylab=expression("p(" * theta * ")"))



