library(qualityTools)


### Name: desirability
### Title: Desirability Function
### Aliases: desirability
### Keywords: Multiple Response Optimization Six Sigma

### ** Examples

#Maximization of a response
#define a desirability for response y where higher values of y are better 
#as long as the response is smaller than high
d = desirability(y, low = 6, high = 18, target = "max")

#show and plot the desirability function
d; plot(d)

#Minimization of a response including a scaling factor
#define a desirability for response y where lower values of y are better 
#as long as the response is higher than low
d = desirability(y, low = 6, high = 18, scale = c(2),target = "min")

#show and plot the desirability function
d; plot(d)

#Specific target of a response is best including a scaling factor
#define a desirability for response y where desired value is at 8 
#and values lower than 6 as well as values higher than 18 are not acceptable
d = desirability(y, low = 6, high = 18, scale = c(0.5,2),target = 12)

#show and plot the desirability function
d; plot(d)



