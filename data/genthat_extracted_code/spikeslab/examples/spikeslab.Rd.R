library(spikeslab)


### Name: spikeslab
### Title: Spike and Slab Regression
### Aliases: spikeslab
### Keywords: regression

### ** Examples


#------------------------------------------------------------
# Example 1:  diabetes data
#------------------------------------------------------------

# basic call
data(diabetesI, package = "spikeslab")
obj <- spikeslab(Y ~ . , diabetesI, verbose=TRUE)
print(obj)
plot(obj)

# grouping effect
# separate main effects and interactions into two groups
# use a group-specific regularization parameter for each group
xnames <- names(diabetesI[, -1])
r.eff <- vector("list", 2)
r.eff[[1]] <- xnames[c(1:10)]
r.eff[[2]] <- xnames[-c(1:10)]
obj2 <- spikeslab(Y ~ . , diabetesI, verbose=TRUE, r.effects=r.eff)
obj2
# extract the regularization parameters
print(apply(obj2$complexity, 2, summary))

## Not run: 
##D #------------------------------------------------------------
##D # Example 2: high-dimensional noise (diabetes data)
##D #------------------------------------------------------------
##D 
##D # add 2000 noise variables
##D data(diabetesI, package = "spikeslab")
##D diabetes.noise <- cbind(diabetesI,
##D       noise = matrix(rnorm(nrow(diabetesI) * 2000), nrow(diabetesI)))
##D 
##D # example of a big p, small n call
##D # don't use formula call; make call with x and y arguments
##D x <- diabetes.noise[, -1]
##D y <- diabetes.noise[, 1]
##D obj <- spikeslab(x=x, y=y, verbose=TRUE, bigp.smalln=TRUE, max.var=100)
##D obj
##D 
##D # same example ... but now group variables 
##D r.eff <- vector("list", 2)
##D r.eff[[1]] <- names(x)[c(1:100)]
##D r.eff[[2]] <- names(x)[-c(1:100)]
##D obj2 <- spikeslab(x=x, y=y, verbose=TRUE, bigp.smalln=TRUE,
##D                  r.effects=r.eff, max.var=100)
##D obj2
##D 
##D #------------------------------------------------------------
##D # Example 3: housing data with interactions
##D #------------------------------------------------------------
##D 
##D # another example of a big p, small n call
##D data(housingI, package = "spikeslab")
##D obj <- spikeslab(medv ~ ., housingI, verbose = TRUE,
##D            bigp.smalln = TRUE, max.var = 200)
##D print(obj)
##D 
##D 
## End(Not run)



