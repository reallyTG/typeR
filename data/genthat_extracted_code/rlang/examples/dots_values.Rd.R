library(rlang)


### Name: dots_values
### Title: Evaluate dots with preliminary splicing
### Aliases: dots_values

### ** Examples

dots <- dots_values(!!! list(1, 2), 3)
dots

# Flatten the objects marked as spliced:
flatten_if(dots, is_spliced)



