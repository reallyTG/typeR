library(cytominer)


### Name: variable_select
### Title: Select observation variables.
### Aliases: variable_select

### ** Examples


# In this example, we use `correlation_threshold` as the operation for 
# variable selection.

suppressMessages(suppressWarnings(library(magrittr)))
population <- tibble::data_frame(
   x = rnorm(100),
   y = rnorm(100)/1000
 )
 
population %<>% dplyr::mutate(z = x + rnorm(100) / 10)

sample <- population %>% dplyr::slice(1:30)

variables <- c("x", "y", "z")

operation <- "correlation_threshold"

cor(sample)

# `x` and `z` are highly correlated; one of them will be removed

head(population)

futile.logger::flog.threshold(futile.logger::ERROR)

variable_select(population, variables, sample, operation) %>% head()




