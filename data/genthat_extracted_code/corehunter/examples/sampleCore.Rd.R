library(corehunter)


### Name: sampleCore
### Title: Sample a core collection.
### Aliases: sampleCore

### ** Examples

## No test: 
data <- exampleData()

# default size, maximize entry-to-nearest-entry Modified Rogers distance
obj <- objective("EN", "MR")
core <- sampleCore(data, obj)

# fast mode
core <- sampleCore(data, obj, mode = "f")
# absolute size
core <- sampleCore(data, obj, size = 25)
# relative size
core <- sampleCore(data, obj, size = 0.1)

# other objective: minimize accession-to-nearest-entry precomputed distance
core <- sampleCore(data, obj = objective(type = "AN", measure = "PD"))
# multiple objectives (equal weight)
core <- sampleCore(data, obj = list(
 objective("EN", "PD"),
 objective("AN", "GD")
))
# multiple objectives (custom weight)
core <- sampleCore(data, obj = list(
 objective("EN", "PD", weight = 0.3),
 objective("AN", "GD", weight = 0.7)
))

# custom stop conditions
core <- sampleCore(data, obj, time = 5, impr.time = 2)
core <- sampleCore(data, obj, steps = 300)

# print progress messages
core <- sampleCore(data, obj, verbose = TRUE)
## End(No test)




