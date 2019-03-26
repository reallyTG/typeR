library(utiml)


### Name: baseline
### Title: Baseline reference for multilabel classification
### Aliases: baseline

### ** Examples

model <- baseline(toyml)
pred <- predict(model, toyml)

## Change the metric
model <- baseline(toyml, "F1")
model <- baseline(toyml, "subset-accuracy")



