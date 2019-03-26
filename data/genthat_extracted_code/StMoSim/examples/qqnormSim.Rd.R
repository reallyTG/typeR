library(StMoSim)


### Name: qqnormSim
### Title: Quantile-Quantile plot with several Gaussian simulations.
### Aliases: qqnormSim qqnormSim,lm-method qqnormSim,numeric-method
### Keywords: qqnorm

### ** Examples

## Not run: 
##D 
##D ######## qqnorm vs. qqnormSim ########
##D 
##D par(mfrow = c(1,2))
##D x<- rnorm(100)
##D qqnorm(x)
##D qqline(x)
##D qqnormSim(x)
##D par(mfrow = c(1,1))
##D 
##D ######## basic functionality/arguments ########
##D 
##D # The observations should behave like a simulation, 
##D # because the observations are sampled from a Gaussian distribution.
##D qqnormSim(x = rnorm(100))
##D 
##D # If you don't feel comfortable with the mad as 
##D # measure of variation you can change it to the standard deviation.
##D qqnormSim(x = rnorm(100),
##D           mOfVar = "sd")
##D 
##D # On the first glance its obvious that this sample 
##D # doesn't originate from a Gaussian distribution due to the heavy tails.
##D qqnormSim(x = rt(100,df = 4))
##D 
##D Reduce the simulation tracks from 500 to 50. (500 is default).
##D Not recommended unless you have not enough computation power.
##D qqnormSim(x = rnorm(100), 
##D           nSim = 50)
##D 
##D ######## graphical arguments ########
##D 
##D # set title and axes labels.
##D qqnormSim(x = rnorm(100), 
##D           main = "main title",
##D           xlab = "x-axis label",
##D           ylab = "y-axis label")
##D           
##D # I don't recommend fancy colors, unless you need it for your corporate identity.
##D qqnormSim(x = rnorm(100), 
##D           qqnormCol = "#ff0000",
##D           qqnormPch = 16,
##D           qqlineCol = "greenyellow",
##D           qqlineLwd = 1)
##D 
## End(Not run)



