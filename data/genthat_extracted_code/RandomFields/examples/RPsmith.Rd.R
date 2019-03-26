library(RandomFields)


### Name: Smith
### Title: (Mixed) Moving Maxima
### Aliases: RPsmith 'mixed moving maxima' 'moving maxima' M2 M3
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMball()
x <- seq(0, 1000, 0.2)
z <- RFsimulate(RPsmith(model, xi=0), x)
plot(z)
hist(z@data$variable1, 50, freq=FALSE)
curve(exp(-x) * exp(-exp(-x)), from=-3, to=8, add=TRUE)

## 2-dim
x <- seq(0, 10, 0.1) 
z <- RFsimulate(RPsmith(model, xi=0), x, x)
plot(z)

## original Smith model
x <- seq(0, 10, 0.05)
model <- RMgauss(scale = sqrt(2)) # !! cf. definition of RMgauss
z <- RFsimulate(RPsmith(model, xi=0), x, x)
plot(z)

## Don't show: ## Not run: 
##D ## original Smith model at arbitrary locations
##D n <- 200
##D model <- RMgauss(scale = sqrt(2)) # !! cf. definition of RMgauss
##D z <- RFsimulate(RPsmith(model, xi=0), runif(n, 0, 10), runif(0, 0, 10))
##D plot(z)
## End(Not run)## End(Don't show)


## for some more sophisticated models see 'maxstableAdvanced'

## Don't show: 
FinalizeExample()
## End(Don't show)


