library(rebmix)


### Name: iris
### Title: Iris Data Set
### Aliases: iris
### Keywords: datasets

### ** Examples

## Not run: 
##D devAskNewPage(ask = TRUE)
##D 
##D data("iris")
##D 
##D # Show level attributes.
##D 
##D levels(iris[["Class"]])
##D 
##D # Split dataset into train (75##D 
##D 
##D set.seed(5)
##D 
##D Iris <- split(p = 0.75, Dataset = iris, class = 5)
##D 
##D # Estimate number of components, component weights and component
##D # parameters for train subsets.
##D 
##D n <- range(a.ntrain(Iris))
##D 
##D irisest <- REBMIX(model = "REBMVNORM",
##D   Dataset = a.train(Iris),
##D   Preprocessing = "kernel density estimation",
##D   cmax = 10,
##D   Criterion = "ICL-BIC",
##D   pdf = rep("normal", 4))
##D 
##D plot(irisest, pos = 1, nrow = 3, ncol = 2, what = c("den"))
##D plot(irisest, pos = 2, nrow = 3, ncol = 2, what = c("den"))
##D plot(irisest, pos = 3, nrow = 3, ncol = 2, what = c("den"))
##D 
##D # Selected chunks.
##D 
##D iriscla <- RCLSMIX(model = "RCLSMVNORM",
##D   x = list(irisest),
##D   Dataset = a.test(Iris),
##D   Zt = a.Zt(Iris))
##D 
##D iriscla
##D 
##D summary(iriscla)
##D 
##D # Plot selected chunks.
##D 
##D plot(iriscla, nrow = 3, ncol = 2)
## End(Not run)



