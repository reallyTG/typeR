library(mosaic)


### Name: zscore
### Title: Compute z-scores
### Aliases: zscore

### ** Examples

iris %>% 
  group_by(Species) %>% 
  mutate(zSepal.Length = zscore(Sepal.Length)) %>% 
  head()



