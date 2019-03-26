library(aurelius)


### Name: pfa.kccasimple
### Title: PFA Formatting of Fitted K-Centroid Models
### Aliases: pfa.kccasimple

### ** Examples

model <- flexclust::kcca(iris[,1:4], k = 3, 
                         family=flexclust::kccaFamily("kmeans"), simple=TRUE)
model_as_pfa <- pfa(model)



