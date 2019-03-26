library(FSelectorRcpp)


### Name: discretize
### Title: Discretization
### Aliases: discretize mdlControl equalsizeControl customBreaksControl

### ** Examples


# vectors
discretize(x = iris[[1]], y = iris[[5]])

# list and vector
head(discretize(x = list(iris[[1]], iris$Sepal.Width), y = iris$Species))

# formula input
head(discretize(x = Species ~ ., y = iris))
head(discretize(Species ~ ., iris))

# use different methods for specific columns
ir1 <- discretize(Species ~ Sepal.Length, iris)
ir2 <- discretize(Species ~ Sepal.Width, ir1, control = equalsizeControl(3))
ir3 <- discretize(Species ~ Petal.Length, ir2, control = equalsizeControl(5))
head(ir3)

# custom breaks
ir <- discretize(Species ~ Sepal.Length, iris,
  control = customBreaksControl(breaks = c(0, 2, 5, 7.5, 10)))
head(ir)

## Not run: 
##D # Same results
##D library(RWeka)
##D Rweka_disc_out <- RWeka::Discretize(Species ~ Sepal.Length, iris)[, 1]
##D FSelectorRcpp_disc_out <- FSelectorRcpp::discretize(Species ~ Sepal.Length,
##D                                                     iris)[, 1]
##D table(Rweka_disc_out, FSelectorRcpp_disc_out)
##D # But faster method
##D library(microbenchmark)
##D microbenchmark(FSelectorRcpp::discretize(Species ~ Sepal.Length, iris),
##D                RWeka::Discretize(Species ~ Sepal.Length, iris))
##D 
## End(Not run)




