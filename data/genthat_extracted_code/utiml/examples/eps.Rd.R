library(utiml)


### Name: eps
### Title: Ensemble of Pruned Set for multi-label Classification
### Aliases: eps

### ** Examples

model <- eps(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D ##Change default configurations
##D model <- eps(toyml, "RF", m=15, subsample=0.4, p=4, strategy="B", b=4)
## End(Not run)



