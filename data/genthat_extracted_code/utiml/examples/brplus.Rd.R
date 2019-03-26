library(utiml)


### Name: brplus
### Title: BR+ or BRplus for multi-label Classification
### Aliases: brplus

### ** Examples

# Use SVM as base algorithm
model <- brplus(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D # Use Random Forest as base algorithm and 4 cores
##D model <- brplus(toyml, 'RF', cores = 4, seed = 123)
## End(Not run)



