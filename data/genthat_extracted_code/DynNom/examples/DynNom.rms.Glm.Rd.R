library(DynNom)


### Name: DynNom.Glm
### Title: Dynamic Nomograms for Generalized Linear Models from the 'rms'
###   package
### Aliases: DynNom.Glm
### Keywords: dynamic nomograms generalized linear models individual
###   prediction shiny

### ** Examples

## Not run: 
##D # example 1 - a generalized linear model
##D set.seed(1)
##D x1 <- runif(200)
##D x2 <- sample(0:3, 200, TRUE)
##D x3 <- sample(0:2, 200, TRUE)
##D 
##D distance <- (x1 + x2 / 3 + rnorm(200)) ^ 2
##D d <- datadist(x1, x2)
##D options(datadist = "d")
##D data1 = data.frame(distance, x1, x2, x3)
##D model1 <- Glm(distance ~ x3 + rcs(x1, 4) * scored(x2), data = data1)
##D DynNom.Glm(model1, data1)
##D 
##D # example 2 - a poisson regression model
##D counts <- c(18, 17, 15, 20, 10, 20, 25, 13, 12)
##D outcome <- gl(3, 1, 9)
##D treatment <- gl(3, 3)
##D data2 = data.frame(counts, outcome, treatment)
##D model2 <- Glm((2 * counts) ~ outcome + treatment, family = poisson(), data = data2)
##D DynNom.Glm(model2, data2)
## End(Not run)

if (interactive()) {
# a Gamma regression model
clotting <- data.frame(
    u = c(5, 10, 15, 20, 30, 40, 60, 80, 100),
    lot1 = c(118, 58, 42, 35, 27, 25, 21, 19, 18),
    lot2 = c(69, 35, 26, 21, 18, 16, 13, 12, 12),
    cat = c(rep("A",5), rep("B",4)))
model3 <- Glm(lot1 ~ log(u) + cat, data = clotting, family = Gamma)
DynNom.Glm(model3, clotting)
}



