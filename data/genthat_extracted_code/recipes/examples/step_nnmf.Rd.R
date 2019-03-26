library(recipes)


### Name: step_nnmf
### Title: NNMF Signal Extraction
### Aliases: step_nnmf tidy.step_nnmf
### Keywords: datagen

### ** Examples

## No test: 
data(biomass)

if (require(dimRed) & require(NMF)) {
  rec <- recipe(HHV ~ ., data = biomass) %>%
    update_role(sample, new_role = "id var") %>%
    update_role(dataset, new_role = "split variable") %>%
    step_nnmf(all_predictors(), num_comp = 2, seed = 473, num_run = 2) %>%
    prep(training = biomass, retain = TRUE)

  juice(rec)

  library(ggplot2)
  ggplot(juice(rec), aes(x = NNMF2, y = NNMF1, col = HHV)) + geom_point()
}
## End(No test)



