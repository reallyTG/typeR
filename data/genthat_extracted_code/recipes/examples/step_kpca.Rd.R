library(recipes)


### Name: step_kpca
### Title: Kernel PCA Signal Extraction
### Aliases: step_kpca tidy.step_kpca
### Keywords: datagen

### ** Examples

data(biomass)

biomass_tr <- biomass[biomass$dataset == "Training",]
biomass_te <- biomass[biomass$dataset == "Testing",]

rec <- recipe(HHV ~ carbon + hydrogen + oxygen + nitrogen + sulfur,
              data = biomass_tr)

kpca_trans <- rec %>%
  step_YeoJohnson(all_predictors()) %>%
  step_center(all_predictors()) %>%
  step_scale(all_predictors()) %>%
  step_kpca(all_predictors())

if (require(dimRed) & require(kernlab)) {
  kpca_estimates <- prep(kpca_trans, training = biomass_tr)

  kpca_te <- bake(kpca_estimates, biomass_te)

  rng <- extendrange(c(kpca_te$kPC1, kpca_te$kPC2))
  plot(kpca_te$kPC1, kpca_te$kPC2,
       xlim = rng, ylim = rng)

  tidy(kpca_trans, number = 4)
  tidy(kpca_estimates, number = 4)
}



