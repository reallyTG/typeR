library(amt)


### Name: extract_covariates
### Title: Extract covariate values
### Aliases: extract_covariates extract_covariates.track_xy
###   extract_covariates.random_points extract_covariates.steps_xy
###   extract_covariates_along extract_covariates_along.steps_xy

### ** Examples

data(deer)
data(sh_forest)
deer %>% extract_covariates(sh_forest)
deer %>% steps %>% extract_covariates(sh_forest)
deer %>% steps %>% extract_covariates(sh_forest, where = "start")
data(deer) # relocation
data("sh_forest") # env covar

p1 <- deer %>% steps() %>% random_steps() %>%
  extract_covariates(sh_forest) %>% # extract at the endpoint
  mutate(for_path = extract_covariates_along(., sh_forest))  %>%
  # 1 = forest, lets calc the fraction of forest along the path
  mutate(for_per = purrr::map_dbl(for_path, ~ mean(. == 1)))




