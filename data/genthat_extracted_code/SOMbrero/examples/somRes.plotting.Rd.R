library(SOMbrero)


### Name: somRes.plotting
### Title: Plotting 'somRes' results
### Aliases: somRes.plotting

### ** Examples

# run the SOM algorithm on the numerical data of 'iris' data set
iris.som <- trainSOM(x.data=iris[,1:4], nb.save=2)

# plots
# on energy
plot(iris.som, what="energy") # energy
# on prototypes
plot(iris.som, what="prototypes", type="3d", variable="Sepal.Length")
# on an additional variable: the flower species
plot(iris.som, what="add", type="pie", variable=iris$Species)



