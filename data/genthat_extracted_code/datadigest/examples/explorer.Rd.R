library(datadigest)


### Name: explorer
### Title: Create an interactive codebook explorer
### Aliases: explorer

### ** Examples

### Generate explorer using all data loaded into R session (default).
explorer(data = NULL, addEnv = TRUE)

### Provide a list of (optionally named) data frames.
explorer(data = list(Cars = mtcars, Iris = iris))

### Alternatively, provide data frames currently loaded in R session as a character vector.
explorer(data = c("mtcars","iris"))

### Generate explorer using data from the datasets package.
explorer(demo = TRUE)





