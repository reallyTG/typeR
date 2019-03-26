library(furrr)


### Name: future_modify
### Title: Modify elements selectively via futures
### Aliases: future_modify future_modify_at future_modify_if

### ** Examples


library(furrr)
library(dplyr) # for the pipe

## No test: 
plan(multiprocess)
## End(No test)

# Convert each col to character, in parallel
future_modify(mtcars, as.character)

iris %>%
 future_modify_if(is.factor, as.character) %>%
 str()

mtcars %>% future_modify_at(c(1, 4, 5), as.character) %>% str()




