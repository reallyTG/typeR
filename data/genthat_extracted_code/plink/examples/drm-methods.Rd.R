library(plink)


### Name: drm-methods
### Title: Dichotomous Response Model Probabilities
### Aliases: drm drm-methods drm,numeric-method drm,matrix-method
###   drm,data.frame-method drm,list-method drm,irt.pars-method
###   drm,sep.pars-method
### Keywords: methods distribution

### ** Examples

###### Unidimensional Examples ######
## 1PL
# A single item with a difficulty at 1 logit
x <- drm(1) 
plot(x)

# Three items with a difficulties at -2.2, -1.7, and 0.54 logits 
# respectively. Assume a constant discrimination of 1 for each item
b <- c(-2.2,-.7,1.54)
x <- drm(b) 
# Plot the expected probabilites
plot(x)

# Five items with a constant discrimination equal to 1.2
# Use the scaling constant for the normal metric
a <- rep(1.2,5)
b <- c(-2,-1,0,1,2)
pars <- list(a,b)
x <- drm(pars,D=1.7)
# Extract the expected probabilities
get.prob(x)
# Plot the expected probabilities
plot(x,combine=5,item.names="Items 1-5")


## 2PL
# Compute probabilities for five items at a theta value of 1.5 logits
# Print the model
a <- c(1,.8,.6,1.2,.9)
b <- c(-1.7,2.2,.4,-1,-.4)
pars <- cbind(a,b)
drm(pars,theta=1.5,print.mod=TRUE)


# Include a vector of zeros for the lower asymptote
# Compute probabilities for incorrect responses
a <- c(.63,1.14,.89,1.01,1.51,.58)
b <- c(-1.9,.08,1.6,-1.4,.5,-2.3)
c <- rep(0,6)
pars <- cbind(a,b,c)
x <- drm(pars,incorrect=TRUE)
plot(x)


## 3PL
a <- c(1,.8,.4,1.5,.9)
b <- c(-2,-1,0,1,2)
c <- c(.2,.25,.18,.2,.22)
pars <- list(a,b,c)
x <- drm(pars)
plot(x)

# Use theta values from -3 to 3 with an increment of 0.2
a <- c(.71,.96,.36,1.05,1.76,.64)
b <- c(-.16,1.18,2.03,1.09,.82,-1.56)
c <- c(.22,.17,.24,.08,.20,.13)
theta <- seq(-3,3,.2)
pars <- cbind(a,b,c)
x <- drm(pars,theta)
plot(x,combine=6,item.names="Items 1-6",auto.key=list(space="right"))

###### Multidimensional Examples ######
## M1PL
# A single item with a parameter related to item difficulty at 1 logit
x <- drm(1, dimensions=2) 
plot(x)

# Three items with a difficulties at -2.2, -1.7, and 0.54 logits 
# respectively. Assume a constant discrimination of 1 for each item
d <- c(-2.2,-.7,1.54)
x <- drm(d, dimensions=2) 
plot(x, drape=TRUE)


## M2PL
# Items 27-30 from Reckase (1985)
a <- matrix(c(1.66,1.72,.69,.19,.88,1.12,.68,1.21),4,2,byrow=TRUE)
d <- c(-.38,-.68,-.91,-1.08)
pars <- list(a,d)
x <- drm(pars,dimensions=2)
plot(x, drape=TRUE, item.names=paste("Item",27:30))

# Create contourplots for these items
plot(x,type="contourplot",cuts=10)


## M3PL
# Single item from Reckase (1997, p. 274)
pars <- t(c(.8,1.4,-2,.2))
x <- drm(pars, dimensions=2)
plot(x, default.scales=list(arrows=FALSE),drape=TRUE)

# Compute the probabilities of an incorrect response
# for the Reckase (1997) item
x <- drm(pars, dimensions=2, incorrect=TRUE)
plot(x, screen=list(z=-40,x=-60), auto.key=list(space="right"))

# Four items from the included example for BMIRT (Yao, 2003)
# modeled using four dimensions
pars <- matrix(c(0.5038,2.1910,1.1317,0.2493,0.5240,0.1763, 
0.2252,1.1999,0.5997,0.2087, 2.1730,0.4576,
0.2167,0.2487,1.4009,0.3865,-1.5270,0.3507, 
2.3428,1.1530,0.3577,0.4240,-1.4971,0.3641),4,6,byrow=TRUE)
colnames(pars) <- c("a1","a2","a3","a4","d","c")
x <- drm(pars, dimensions=4, print.mod=TRUE)


## Not run: 
##D # Plot the item response surfaces for item 4
##D plot(x,items=4,item.names="Item 4",drape=TRUE)
## End(Not run)



