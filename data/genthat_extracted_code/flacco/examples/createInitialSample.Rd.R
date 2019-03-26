library(flacco)


### Name: createInitialSample
### Title: Create Initial Sample
### Aliases: createInitialSample

### ** Examples

# (1) create a simple initial sample:
X = createInitialSample(300, 5)
summary(X)

# (2) create a more specific initial sample:
ctrl = list(init_sample.type = "lhs",
  init_sample.lower = c(-5, 2, 0),
  init_sample.upper = 10)
X = createInitialSample(200, 3, control = ctrl)
summary(X)




