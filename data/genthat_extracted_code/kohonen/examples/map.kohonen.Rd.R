library(kohonen)


### Name: map.kohonen
### Title: Map data to a supervised or unsupervised SOM
### Aliases: map.kohonen map
### Keywords: classif

### ** Examples

data(wines)
set.seed(7)

training <- sample(nrow(wines), 150)
Xtraining <- scale(wines[training, ])
somnet <- som(Xtraining, somgrid(5, 5, "hexagonal"))

map(somnet,
    scale(wines[-training, ],
          center=attr(Xtraining, "scaled:center"),
          scale=attr(Xtraining, "scaled:scale")))



