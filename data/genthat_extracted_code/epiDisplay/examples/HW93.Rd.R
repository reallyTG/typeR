library(epiDisplay)


### Name: Hookworm 1993
### Title: Dataset from a study on hookworm prevalence and intensity in
###   1993
### Aliases: HW93
### Keywords: datasets

### ** Examples

data(HW93)
des(HW93)
.data <- HW93
.data$order.intense <- ordered(.data$intense)
ord.hw <- polr(ordered(intense) ~ agegr + shoe, data=.data)
summary(ord.hw)
ordinal.or.display(ord.hw)



