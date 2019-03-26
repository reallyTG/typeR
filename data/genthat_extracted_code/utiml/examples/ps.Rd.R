library(utiml)


### Name: ps
### Title: Pruned Set for multi-label Classification
### Aliases: ps

### ** Examples

model <- ps(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D ##Change default configurations
##D model <- ps(toyml, "RF", p=4, strategy="B", b=4)
## End(Not run)



