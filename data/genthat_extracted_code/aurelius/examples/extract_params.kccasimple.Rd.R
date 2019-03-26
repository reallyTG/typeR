library(aurelius)


### Name: extract_params.kccasimple
### Title: extract_params.kccasimple
### Aliases: extract_params.kccasimple

### ** Examples

model <- flexclust::kcca(iris[,1:4], k = 3, 
                         family=flexclust::kccaFamily("kmeans"), simple=TRUE)
extracted_params <- extract_params(model)



