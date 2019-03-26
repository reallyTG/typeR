library(KrigInv)


### Name: excursion_probability
### Title: Excursion probability with one or many thresholds
### Aliases: excursion_probability

### ** Examples

#excursion_probability

set.seed(9)
N <- 20 #number of observations
testfun <- branin

#a 20 points initial design
design <- data.frame( matrix(runif(2*N),ncol=2) )
response <- testfun(design)

#km object with matern3_2 covariance
#params estimated by ML from the observations
model <- km(formula=~., design = design, 
            response = response,covtype="matern3_2")

some_points <- matrix(runif(20),ncol=2)
pred <- predict_nobias_km(object = model,newdata = some_points,
                type = "UK",se.compute = TRUE)
                
T <- c(60,80,100)
excursion_probability(mn = pred$mean,sn = pred$sd,T=T)
# probability to be in the interval [60,80] U [100, infty]



