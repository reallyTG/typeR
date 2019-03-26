library(recipes)


### Name: step_lincomb
### Title: Linear Combination Filter
### Aliases: step_lincomb tidy.step_lincomb
### Keywords: datagen

### ** Examples

data(biomass)

biomass$new_1 <- with(biomass,
                      .1*carbon - .2*hydrogen + .6*sulfur)
biomass$new_2 <- with(biomass,
                      .5*carbon - .2*oxygen + .6*nitrogen)

biomass_tr <- biomass[biomass$dataset == "Training",]
biomass_te <- biomass[biomass$dataset == "Testing",]

rec <- recipe(HHV ~ carbon + hydrogen + oxygen + nitrogen +
                sulfur + new_1 + new_2,
              data = biomass_tr)

lincomb_filter <- rec %>%
  step_lincomb(all_predictors())

lincomb_filter_trained <- prep(lincomb_filter, training = biomass_tr)
lincomb_filter_trained

tidy(lincomb_filter, number = 1)
tidy(lincomb_filter_trained, number = 1)



