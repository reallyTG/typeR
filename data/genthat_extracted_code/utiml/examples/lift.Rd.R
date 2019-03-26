library(utiml)


### Name: lift
### Title: LIFT for multi-label Classification
### Aliases: lift

### ** Examples

model <- lift(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D # Runing lift with a specific ratio
##D model <- lift(toyml, "RF", 0.15)
## End(Not run)



