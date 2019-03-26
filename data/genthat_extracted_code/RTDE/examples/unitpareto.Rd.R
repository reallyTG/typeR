library(RTDE)


### Name: upareto
### Title: The unit Pareto Distribution
### Aliases: upareto dupareto pupareto qupareto rupareto
### Keywords: distribution

### ** Examples


#####
# (1) density function
x <- seq(0, 5, length=24)

cbind(x, dupareto(x))

#####
# (2) distribution function

cbind(x, pupareto(x))




		



