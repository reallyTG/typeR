library(repeated)


### Name: catmiss
### Title: Marginal Probabilities for Categorical Repeated Measurements
###   with Missing Data
### Aliases: catmiss
### Keywords: models

### ** Examples


y <- rpois(27,15)
r1 <- gl(3,1,27)
r2 <- gl(3,3,27)
r3 <- gl(3,9)
# r1, r2, and r3 are factor variables with 3 indicating missing
# independence model with three binary repeated measures
# with missing values
print(z <- glm(y~r1+r2+r3, family=poisson))
# obtain marginal estimates (no observations with 3 missing values)
resp <- cbind(as.integer(r1), as.integer(r2), as.integer(r3))[1:26,]
resp <- ifelse(resp==3, NA, resp)
catmiss(resp, y[1:26])




