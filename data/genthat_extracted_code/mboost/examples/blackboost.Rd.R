library(mboost)


### Name: blackboost
### Title: Gradient Boosting with Regression Trees
### Aliases: blackboost
### Keywords: models regression

### ** Examples


### a simple two-dimensional example: cars data
cars.gb <- blackboost(dist ~ speed, data = cars,
                      control = boost_control(mstop = 50))
cars.gb

### plot fit
plot(dist ~ speed, data = cars)
lines(cars$speed, predict(cars.gb), col = "red")

## No test: 
############################################################
## Do not run this example automatically as it takes
## some time (~ 5-10 seconds depending on the system)

### set up and plot additive tree model
if (require("partykit")) {
    ctrl <- ctree_control(maxdepth = 3)
    viris <- subset(iris, Species != "setosa")
    viris$Species <- viris$Species[, drop = TRUE]
    imod <- mboost(Species ~ btree(Sepal.Length, tree_controls = ctrl) +
                             btree(Sepal.Width, tree_controls = ctrl) +
                             btree(Petal.Length, tree_controls = ctrl) +
                             btree(Petal.Width, tree_controls = ctrl),
                   data = viris, family = Binomial())[500]
    layout(matrix(1:4, ncol = 2))
    plot(imod)
}
## End(No test)




