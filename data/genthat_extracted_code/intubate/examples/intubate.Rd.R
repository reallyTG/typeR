library(intubate)


### Name: intubate
### Title: 1) Interfaces "on demand" and 2) calling of non-pipe-aware
###   functions directly.
### Aliases: intubate ntbt ntbt_function_formula_data
###   ntbt_function_model_data ntbt_function_object_data
###   ntbt_function_x_data
### Keywords: intubate magrittr ntbt

### ** Examples

## Not run: 
##D library(intubate)
##D 
##D ## NOTE: intubate implements an interface to
##D ##       *xyplot* (in package lattice), called *ntbt_xyplot*.
##D ##       For the sake of argument, let's suppose the
##D ##       interface does not exist, and you want to implement
##D ##       it "on demand" to use it in a pipeline.
##D 
##D ## Original function you would like to interface
##D library(lattice)
##D xyplot(Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
##D        iris, scales = "free", layout = c(2, 2),
##D        auto.key = list(x = .6, y = .7, corner = c(0, 0)))
##D 
##D ## If you try to use *xyplot* directly in a data pipeline
##D ## it will raise an error
##D library(magrittr)
##D try(iris %>%
##D     xyplot(Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
##D            scales = "free", layout = c(2, 2),
##D            auto.key = list(x = .6, y = .7, corner = c(0, 0))),
##D     silent = TRUE)
##D geterrmessage()
##D 
##D ## The error disappears if you create an interface to *xyplot*.
##D 
##D ## Step needed to create an interface to *xyplot*.
##D 
##D ntbt_xyplot <- intubate
##D 
##D ## NOTE: names of interfaces must start with
##D ##       *ntbt_* followed by the name of the function
##D ##       (*xyplot* in this case) you want to interface.
##D 
##D ## Now you can use the interface instead of the original
##D ## function. Just remember to switch the order of
##D ## *data* and *x* (there is no need to name the parameters).
##D ntbt_xyplot(iris, 
##D             Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
##D             scales = "free", layout = c(2, 2),
##D             auto.key = list(x = .6, y = .7, corner = c(0, 0)))
##D 
##D ## The newly created interface can be used easily in a pipeline.
##D library(magrittr)
##D iris %>%
##D   ntbt_xyplot(Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
##D               scales = "free", layout = c(2, 2),
##D               auto.key = list(x = .6, y = .7, corner = c(0, 0)))
##D 
##D ## Alternative: call non-pipe-aware function directly.
##D ## You can also avoid creating an interface, by calling ntbt with the name of
##D ## the function to interface.
##D ntbt(iris, xyplot,
##D      Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
##D      scales = "free", layout = c(2, 2),
##D      auto.key = list(x = .6, y = .7, corner = c(0, 0)))
##D 
##D ## In a pipeline
##D iris %>%
##D   ntbt(xyplot, Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
##D        scales = "free", layout = c(2, 2),
##D        auto.key = list(x = .6, y = .7, corner = c(0, 0)))
## End(Not run)



