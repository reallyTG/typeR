library(pmml)


### Name: pmml.kmeans
### Title: Generate PMML for kmeans objects
### Aliases: pmml.kmeans

### ** Examples

ds <- rbind(matrix(rnorm(100, sd = 0.3), ncol = 2),
                matrix(rnorm(100, mean = 1, sd = 0.3), ncol = 2))
colnames(ds) <- c("Dimension1", "Dimension2")
cl <- kmeans(ds, 2)
pmml(cl)




