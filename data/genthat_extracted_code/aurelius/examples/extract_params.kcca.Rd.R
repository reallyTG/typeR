library(aurelius)


### Name: extract_params.kcca
### Title: extract_params.kcca
### Aliases: extract_params.kcca

### ** Examples

model <- flexclust::kcca(iris[,1:4], k = 3, family=flexclust::kccaFamily("kmeans"))
extracted_params <- extract_params(model)



