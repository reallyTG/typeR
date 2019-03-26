library(superml)


### Name: KMeansTrainer
### Title: K-Means Trainer
### Aliases: KMeansTrainer
### Keywords: datasets

### ** Examples

data <- rbind(replicate(20, rnorm(1e4, 2)),
             replicate(20, rnorm(1e4, -1)),
             replicate(20, rnorm(1e4, 5)))
km_model <- KMeansTrainer$new(clusters=2, batch_size=30, max_clusters=6)
km_model$fit(data, find_optimal = FALSE)
predictions <- km_model$predict(data)



