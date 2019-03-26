library(fuzzyforest)


### Name: select_control
### Title: Set Parameters for Selection Step of Fuzzy Forests
### Aliases: select_control

### ** Examples

drop_fraction <- .25
number_selected <- 10
mtry_factor <- 1
min_ntree <- 5000
ntree_factor <- 5
select_params <- select_control(drop_fraction=drop_fraction,
                                number_selected=number_selected,
                                mtry_factor=mtry_factor,
                                min_ntree=min_ntree,
                                ntree_factor=ntree_factor)



