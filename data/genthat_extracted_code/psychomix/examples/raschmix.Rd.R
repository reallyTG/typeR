library(psychomix)


### Name: raschmix
### Title: Finite Mixtures of Rasch Models
### Aliases: raschmix FLXMCrasch
### Keywords: item response Rasch model mixture model

### ** Examples

##########
## Data ##
##########

## simulate response from Rost's scenario 2 (with 2 latent classes)
set.seed(1)
r2 <- simRaschmix(design = "rost2")

## plus informative and non-informative concomitants
d <- data.frame(
  x1 = rbinom(nrow(r2), prob = c(0.4, 0.6)[attr(r2, "cluster")], size = 1),
  x2 = rnorm(nrow(r2))
)
d$resp <- r2

## fit model with 2 latent classes (here the number is known a priori)
m <- raschmix(r2, k = 2, scores = "saturated")
summary(m)

## see below for examples which do not use this a priori information
## (these take a little longer to compute) 


## No test: 
####################################################
## Rasch mixture model with saturated score model ##
## (Rost, 1990)                                   ##
####################################################

## fit models for k = 1, 2, 3
m1 <- raschmix(r2, k = 1:3, score = "saturated")
## equivalently: m1 <- raschmix(resp ~ 1, data = d, k = 1:3, score = "saturated")

## inspect results
m1
plot(m1)

## select best BIC model
BIC(m1)
m1b <- getModel(m1, which = "BIC")
summary(m1b)

## compare estimated with true item parameters
parameters(m1b, "item") ##  9 items, item_1 = 0
worth(m1b)              ## 10 items, sum = 0
attr(r2, "difficulty")

## graphical comparison
plot(m1b, pos = "top")
for(i in 1:2) lines(attr(r2, "difficulty")[,i], lty = 2, type = "b")

## extract estimated raw score probabilities
## (approximately equal across components and roughly uniform)
scoreProbs(m1b)

## note: parameters() and worth() take "component" argument
parameters(m1b, "item",  component = 2)
parameters(m1b, "score", component = 1)
worth(m1b, component = 2:1)

## inspect posterior probabilities
histogram(m1b)
head(posterior(m1b)) ## for first observations only

## compare resulting clusters with true groups
table(model = clusters(m1b), true = attr(r2, "cluster"))
## End(No test)

## optionally: leverage mRm package for faster computation of
## starting values
## Not run: 
##D library("mRm")
##D ## fit 2-component model
##D m1b_mrm <- raschmix(r2, k = 2, score = "saturated", cluster = "mrm")
##D ## essentially identical to previous solution
##D table(clusters(m1b), clusters(m1b_mrm))   
##D worth(m1b) - worth(m1b_mrm)
## End(Not run)

## No test: 
################################################################
##  Rasch mixture model with mean/variance score distribution ##
## (Rost & von Davier, 1995)                                  ##
################################################################

## more parsimonious parameterization,
## fit multinomial logit model for score probabilities

## fit models and select best BIC
m2 <- raschmix(r2, k = 1:3, score = "meanvar")
plot(m2)
m2b <- getModel(m2, which = "BIC")

## compare number of estimated parameters
dim(parameters(m2b)) 
dim(parameters(m1b)) 

## graphical comparison with true parameters
plot(m2b, pos = "top")
for(i in 1:2) lines(attr(r2, "difficulty")[,i], lty = 2, type = "b")

## results from non-parametric and parametric specification
## essentially identical
max(abs(worth(m1b) - worth(m2b, component = 2:1)))
## End(No test)


###########################
## Concomitant variables ##
###########################

## employ concomitant variables (x1 = informative, x2 = not)
## Not run: 
##D ## fit model
##D cm2 <- raschmix(resp ~ x1 + x2, data = d, k = 2:3, score = "meanvar")
##D 
##D ## BIC selection
##D rbind(m2 = BIC(m2), cm2 = c(NA, BIC(cm2)))
##D cm2b <- getModel(cm2, which = "BIC")
##D 
##D ## concomitant coefficients
##D parameters(cm2b, which = "concomitant")
## End(Not run)


##########
## Misc ##
##########

## note: number of clusters can either be chosen directly
## or directly selected via AIC (or BIC, ICL)
## Not run: 
##D raschmix(r2, k = 2)
##D raschmix(r2, k = 1:3, which = "AIC")
## End(Not run)



