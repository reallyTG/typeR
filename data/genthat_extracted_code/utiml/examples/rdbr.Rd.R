library(utiml)


### Name: rdbr
### Title: Recursive Dependent Binary Relevance (RDBR) for multi-label
###   Classification
### Aliases: rdbr

### ** Examples

model <- rdbr(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D # Use Random Forest as base algorithm and 4 cores
##D model <- rdbr(toyml, 'RF', cores = 4, seed = 123)
## End(Not run)



