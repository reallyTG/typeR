library(recipes)


### Name: step_isomap
### Title: Isomap Embedding
### Aliases: step_isomap tidy.step_isomap
### Keywords: datagen

### ** Examples

## No test: 
data(biomass)

biomass_tr <- biomass[biomass$dataset == "Training",]
biomass_te <- biomass[biomass$dataset == "Testing",]

rec <- recipe(HHV ~ carbon + hydrogen + oxygen + nitrogen + sulfur,
              data = biomass_tr)

im_trans <- rec %>%
  step_YeoJohnson(all_predictors()) %>%
  step_center(all_predictors()) %>%
  step_scale(all_predictors()) %>%
  step_isomap(all_predictors(),
              neighbors = 100,
              num_terms = 2)

if (require(dimRed) & require(RSpectra)) {
  im_estimates <- prep(im_trans, training = biomass_tr)

  im_te <- bake(im_estimates, biomass_te)

  rng <- extendrange(c(im_te$Isomap1, im_te$Isomap2))
  plot(im_te$Isomap1, im_te$Isomap2,
       xlim = rng, ylim = rng)

  tidy(im_trans, number = 4)
  tidy(im_estimates, number = 4)
}
## End(No test)



