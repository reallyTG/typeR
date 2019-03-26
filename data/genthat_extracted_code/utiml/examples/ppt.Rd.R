library(utiml)


### Name: ppt
### Title: Pruned Problem Transformation for multi-label Classification
### Aliases: ppt

### ** Examples

model <- ppt(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D ##Change default configurations
##D model <- ppt(toyml, "RF", p=4, info.loss=TRUE)
## End(Not run)



