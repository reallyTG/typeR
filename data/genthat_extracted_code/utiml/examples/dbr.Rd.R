library(utiml)


### Name: dbr
### Title: Dependent Binary Relevance (DBR) for multi-label Classification
### Aliases: dbr

### ** Examples

model <- dbr(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D # Use Random Forest as base algorithm and 4 cores
##D model <- dbr(toyml, 'RF', cores = 4)
## End(Not run)



