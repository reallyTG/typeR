library(physiology)


### Name: ideal_weight
### Title: ideal weight for adults
### Aliases: ideal_weight ideal_weight_adult ideal_weight_child
###   ideal_weight_Devine ideal_weight_Robinson ideal_weight_Miller
###   ideal_weight_Broca ideal_weight_Lemmens

### ** Examples

ideal_weight_adult(1.7, male = TRUE)
ideal_weight_adult(1.7, male = FALSE)
ideal_weight_adult(6 * 12 * 2.54 / 100, male = TRUE) # 6ft
suppressWarnings(ideal_weight_adult(5, male = FALSE))



