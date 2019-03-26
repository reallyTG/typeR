library(ahaz)


### Name: ahazisis
### Title: Independent screening for the semiparametric additive hazards
###   model
### Aliases: ahazisis
### Keywords: survival

### ** Examples

data(sorlie)

# Break ties
set.seed(10101)
time <- sorlie$time+runif(nrow(sorlie))*1e-2

# Survival data + covariates
surv <- Surv(time,sorlie$status)
X <- as.matrix(sorlie[,3:ncol(sorlie)])

# Basic ISIS/SIS with a single step
set.seed(10101)
m1 <- ahazisis(surv,X,maxloop=1,rank="coef")
m1
# Indices of the variables from the initial recruitment step
m1$SISind
# Indices of selected variables
m1$ISISind
# Check fit
score <- X[,m1$ISISind]%*%m1$ISIScoef
plot(survfit(surv~I(score>median(score))))




