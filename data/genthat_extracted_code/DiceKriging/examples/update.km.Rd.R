library(DiceKriging)


### Name: update
### Title: Update of a kriging model
### Aliases: update update.km update,km-method

### ** Examples

set.seed(8)
N <- 9 # number of observations
testfun <- branin

# a 9 points initial design 
design <- expand.grid(x1=seq(0,1,length=3), x2=seq(0,1,length=3))
response <- testfun(design)

# km object with matern3_2 covariance
# params estimated by ML from the observations
model <- km(formula = ~., design = design, 
	response = response, covtype = "matern3_2")
model@covariance

newX <- matrix(c(0.4,0.5), ncol = 2) #the point that we are going to add in the km object
newy <- testfun(newX)
newmodel <- update(object = model, newX = newX, newy = newy, cov.reestim = TRUE)
newmodel@covariance



