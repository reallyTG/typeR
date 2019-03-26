library(utiml)


### Name: homer
### Title: Hierarchy Of Multilabel classifiER (HOMER)
### Aliases: homer

### ** Examples

model <- homer(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D ##Change default configurations
##D model <- homer(toyml, "RF", clusters=5, method="clustering", iteration=10)
## End(Not run)



