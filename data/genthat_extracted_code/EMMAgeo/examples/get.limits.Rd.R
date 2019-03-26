library(EMMAgeo)


### Name: get.limits
### Title: Create lower and upper mode position limits to define robust
###   end-members.
### Aliases: get.limits
### Keywords: EMMA

### ** Examples

## load example data set
data(X, envir = environment())

## define parameters
l <- c(0, 0.1)
q <- rbind(c(2, 3),
           c(3, 4))

## model all possible end-members
em.pot <- model.em(X = X,
                   q = q,
                   l = l)

## infer mode cluster limits
limits <- get.limits(loadings = em.pot$loadings)



