library(earth)


### Name: update.earth
### Title: Update an earth model
### Aliases: update.earth
### Keywords: models

### ** Examples

data(ozone1)

(earth.mod <- earth(O3 ~ ., data = ozone1, degree = 2))

update(earth.mod, formula = O3 ~ . - temp) # requires forward pass and pruning

update(earth.mod, nprune = 8)              # requires only pruning

update(earth.mod, penalty=1, ponly=TRUE)   # pruning pass only with a new penalty



