library(marg)


### Name: update.rsm
### Title: Update and Re-fit a RSM Model Call
### Aliases: update.rsm
### Keywords: models regression

### ** Examples

data(houses)
houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
## model fit including all covariates
##
houses.rsm <- update(houses.rsm, method = "rsm.fit", 
                     control = glm.control(trace = TRUE))
## prints information about the iterative procedure at each iteration
##
update(houses.rsm, ~ . - bdroom + offset(7 * bdroom))
## "bdroom" is included as offset variable with fixed (= 7) coefficient



