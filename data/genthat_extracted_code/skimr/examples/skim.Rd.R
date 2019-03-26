library(skimr)


### Name: skim
### Title: Skim a data frame, getting useful summary statistics
### Aliases: skim skim_tee

### ** Examples

skim(iris)

# Use tidyselect
skim(iris, Species)
skim(iris, starts_with("Sepal"))

# Skim also works groupwise
dplyr::group_by(iris, Species) %>% skim()

# Skim pipelines; now we work with the tall format
skim(iris) %>% as.data.frame()
skim(iris) %>% dplyr::filter(type == "factor")

# Which column as the greatest mean value?
skim(iris) %>%
  dplyr::filter(stat == "mean") %>%
  dplyr::arrange(dplyr::desc(value))

# Use skim_tee to view the skim results and
# continue using the original data.
chickwts %>% skim_tee() %>% dplyr::filter(feed == "sunflower")



