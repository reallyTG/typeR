library(cytominer)


### Name: correlation_threshold
### Title: Remove redundant variables.
### Aliases: correlation_threshold

### ** Examples


suppressMessages(suppressWarnings(library(magrittr)))
sample <- tibble::data_frame(
   x = rnorm(30),
   y = rnorm(30)/1000
 )
 
sample %<>% dplyr::mutate(z = x + rnorm(30) / 10)
variables <- c("x", "y", "z")

head(sample)
cor(sample)

# `x` and `z` are highly correlated; one of them will be removed

correlation_threshold(variables, sample)




