library(diceR)


### Name: dice
### Title: Diverse Clustering Ensemble
### Aliases: dice

### ** Examples

library(dplyr)
data(hgsc)
dat <- hgsc[1:100, 1:50]
ref.cl <- strsplit(rownames(dat), "_") %>%
  purrr::map_chr(2) %>%
  factor() %>%
  as.integer()
dice.obj <- dice(dat, nk = 4, reps = 5, algorithms = "hc", cons.funs =
"kmodes", ref.cl = ref.cl, progress = FALSE)
str(dice.obj, max.level = 2)



