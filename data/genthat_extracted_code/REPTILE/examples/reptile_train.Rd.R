library(REPTILE)


### Name: reptile_train
### Title: Learn a REPTILE enhancer model
### Aliases: reptile_train
### Keywords: model training

### ** Examples

library("REPTILE")
data("rsd")

## Training
rsd_model <- reptile_train(rsd$training_data$region_epimark,
                           rsd$training_data$region_label,
                           rsd$training_data$DMR_epimark,
                           rsd$training_data$DMR_label,
                           ntree=5)

print(rsd_model$D)
print(rsd_model$R)



