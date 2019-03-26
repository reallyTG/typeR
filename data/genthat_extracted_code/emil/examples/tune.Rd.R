library(emil)


### Name: tune
### Title: Tune parameters of modeling procedures
### Aliases: tune is_tuned is_tunable detune

### ** Examples

procedure <- modeling_procedure("randomForest", parameter=list(mtry=1:4))
tuned.procedure <- tune(procedure, x=iris[-5], y=iris$Species)
mod <- fit(tuned.procedure, x=iris[-5], y=iris$Species)



