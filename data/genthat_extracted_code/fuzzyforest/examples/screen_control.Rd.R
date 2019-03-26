library(fuzzyforest)


### Name: screen_control
### Title: Set Parameters for Screening Step of Fuzzy Forests
### Aliases: screen_control

### ** Examples

drop_fraction <- .25
keep_fraction <- .1
mtry_factor <- 1
min_ntree <- 5000
ntree_factor <- 5
screen_params <- screen_control(drop_fraction=drop_fraction,
                                keep_fraction=keep_fraction,
                                mtry_factor=mtry_factor,
                                min_ntree=min_ntree,
                                ntree_factor=ntree_factor)



