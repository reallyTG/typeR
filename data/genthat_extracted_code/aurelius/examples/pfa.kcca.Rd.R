library(aurelius)


### Name: pfa.kcca
### Title: PFA Formatting of Fitted K-Centroid Models
### Aliases: pfa.kcca

### ** Examples

model <- flexclust::kcca(iris[,1:4], k = 3, family=flexclust::kccaFamily("kmeans"))
model_as_pfa <- pfa(model)



